/**
 * FULLSCREEN STORY CONTROLLER
 * Supports: Snap-scrolling between full-screen scenes,
 * wax seal unsealing, background music toggle, live countdowns.
 */

document.addEventListener('DOMContentLoaded', () => {

    const envelopeOverlay = document.getElementById('envelopeOverlay');
    const openEnvelopeBtn = document.getElementById('openEnvelopeBtn');
    const weddingBgAudio = document.getElementById('weddingBgAudio');
    const musicToggle = document.getElementById('musicToggle');
    const musicLabel = document.getElementById('musicLabel');
    const storySlides = document.querySelectorAll('.story-slide');
    const container = document.querySelector('.fullscreen-story-container');
    const body = document.body;

    let isMusicPlaying = false;
    let userMuted = false;
    let autoUnlockTimer = null;
    let autoCountdownInterval = null;
    const autoOpenCountdownEl = document.getElementById('autoOpenCountdown');

    // 1. WAX SEAL INTRO HANDLER (10-Second Auto-Advance + Click to Open Immediately)
    function unlockInvitation() {
        if (autoUnlockTimer) {
            clearTimeout(autoUnlockTimer);
            autoUnlockTimer = null;
        }
        if (autoCountdownInterval) {
            clearInterval(autoCountdownInterval);
            autoCountdownInterval = null;
        }
        if (envelopeOverlay && !envelopeOverlay.classList.contains('opened')) {
            envelopeOverlay.classList.add('opened');
        }
        if (!userMuted && !isMusicPlaying) {
            playAudioSafely();
        }
    }

    // Countdown display (10s -> 0s) on the envelope card
    let remainingSeconds = 10;
    autoCountdownInterval = setInterval(() => {
        remainingSeconds -= 1;
        if (autoOpenCountdownEl && remainingSeconds >= 0) {
            autoOpenCountdownEl.textContent = String(remainingSeconds);
        }
        if (remainingSeconds <= 0) {
            clearInterval(autoCountdownInterval);
            autoCountdownInterval = null;
        }
    }, 1000);

    // Auto move to next screen if user does not click within 10 seconds
    autoUnlockTimer = setTimeout(() => {
        unlockInvitation();
    }, 10000);

    // If user clicks or taps anywhere on the envelope screen within 10s, open immediately
    if (envelopeOverlay) {
        envelopeOverlay.addEventListener('click', () => {
            unlockInvitation();
        });
        envelopeOverlay.addEventListener('touchend', () => {
            unlockInvitation();
        }, { passive: true });
    }

    if (openEnvelopeBtn) {
        openEnvelopeBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            unlockInvitation();
        });
        openEnvelopeBtn.addEventListener('touchend', (e) => {
            e.stopPropagation();
            unlockInvitation();
        }, { passive: true });
    }

    // Direct anchor link bypass
    if (window.location.hash) {
        unlockInvitation();
        const target = document.querySelector(window.location.hash);
        if (target) {
            setTimeout(() => {
                target.scrollIntoView({ behavior: 'auto', block: 'start' });
            }, 100);
        }
    }

    // Scroll wheel trigger on envelope
    window.addEventListener('wheel', (e) => {
        if (e.deltaY > 15 && envelopeOverlay && !envelopeOverlay.classList.contains('opened')) {
            unlockInvitation();
        }
    }, { passive: true });

    // Touch swipe trigger on envelope
    let touchStartY = 0;
    window.addEventListener('touchstart', (e) => {
        if (e.touches && e.touches[0]) {
            touchStartY = e.touches[0].clientY;
        }
    }, { passive: true });

    window.addEventListener('touchend', (e) => {
        if (e.changedTouches && e.changedTouches[0]) {
            const diff = touchStartY - e.changedTouches[0].clientY;
            if (diff > 30 && envelopeOverlay && !envelopeOverlay.classList.contains('opened')) {
                unlockInvitation();
            }
        }
    }, { passive: true });

    // 2. AUDIO MANAGEMENT (Start immediately when user lands on card + fallback on first gesture)
    const interactionEvents = ['click', 'touchend', 'pointerup', 'keydown', 'touchstart', 'wheel', 'scroll'];

    function updateMusicUI(playing, labelText) {
        if (musicToggle) {
            musicToggle.classList.toggle('playing', playing);
        }
        if (musicLabel) {
            musicLabel.textContent = labelText;
        }
    }

    function removeInteractionListeners() {
        interactionEvents.forEach(evt => {
            document.removeEventListener(evt, startAudioOnInteraction, { capture: true });
        });
    }

    function playAudioSafely() {
        if (!weddingBgAudio || userMuted) return;
        if (!weddingBgAudio.paused && isMusicPlaying) return;

        weddingBgAudio.muted = false;
        weddingBgAudio.volume = 0.65;

        const playPromise = weddingBgAudio.play();
        if (playPromise !== undefined) {
            playPromise.then(() => {
                isMusicPlaying = true;
                updateMusicUI(true, 'Playing');
                removeInteractionListeners();
            }).catch(() => {
                // Browser blocked unmuted autoplay before gesture; keep listeners active for first touch/click
                isMusicPlaying = false;
                updateMusicUI(false, 'Tap for Music');
            });
        }
    }

    // Start song immediately as soon as the user arrives on the wedding card (even while on the 10s intro card)
    playAudioSafely();
    if (weddingBgAudio) {
        weddingBgAudio.addEventListener('canplay', () => {
            if (!isMusicPlaying && !userMuted) {
                playAudioSafely();
            }
        }, { once: true });
    }

    // Ensure audio begins on first valid user interaction if auto-play was blocked.
    // Listeners are only removed once play() actually resolves!
    function startAudioOnInteraction(e) {
        if (e && e.target && e.target.closest && e.target.closest('#musicToggle')) {
            return;
        }
        if (userMuted || isMusicPlaying) {
            removeInteractionListeners();
            return;
        }
        playAudioSafely();
    }

    interactionEvents.forEach(evt => {
        document.addEventListener(evt, startAudioOnInteraction, { passive: true, capture: true });
    });

    if (musicToggle) {
        musicToggle.addEventListener('click', (e) => {
            e.stopPropagation();
            if (!weddingBgAudio) return;
            if (isMusicPlaying && !weddingBgAudio.paused) {
                weddingBgAudio.pause();
                isMusicPlaying = false;
                userMuted = true;
                updateMusicUI(false, 'Muted');
                removeInteractionListeners();
            } else {
                userMuted = false;
                weddingBgAudio.muted = false;
                weddingBgAudio.volume = 0.65;
                weddingBgAudio.play().then(() => {
                    isMusicPlaying = true;
                    updateMusicUI(true, 'Playing');
                    removeInteractionListeners();
                }).catch(() => {
                    isMusicPlaying = false;
                    updateMusicUI(false, 'Tap for Music');
                });
            }
        });
    }

    // 3. JUMP TO SLIDE & BARAT STEP CONTROLLER
    window.goToSlide = function(selector) {
        const target = document.querySelector(selector);
        if (target) {
            target.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
    };

    let currentBaratStep = 1;
    let baratAutoAdvanceTimer = null;

    window.switchBaratStep = function(stepNum) {
        currentBaratStep = stepNum;
        
        // Update tabs
        document.querySelectorAll('.story-tab-btn').forEach(btn => {
            if (parseInt(btn.getAttribute('data-step')) === stepNum) {
                btn.classList.add('active');
            } else {
                btn.classList.remove('active');
            }
        });

        // Update dots
        document.querySelectorAll('.step-dot').forEach((dot, idx) => {
            if (idx + 1 === stepNum) {
                dot.classList.add('active');
            } else {
                dot.classList.remove('active');
            }
        });

        // Update stage panels with transition
        document.querySelectorAll('.story-phase-panel').forEach((panel, idx) => {
            if (idx + 1 === stepNum) {
                panel.classList.add('active');
                // Re-trigger panel animation
                panel.style.animation = 'none';
                void panel.offsetWidth;
                panel.style.animation = '';
            } else {
                panel.classList.remove('active');
            }
        });
    };

    function startBaratStoryCycle() {
        if (baratAutoAdvanceTimer) clearInterval(baratAutoAdvanceTimer);
        baratAutoAdvanceTimer = setInterval(() => {
            let nextStep = currentBaratStep + 1;
            if (nextStep > 3) nextStep = 1;
            switchBaratStep(nextStep);
        }, 4500); // Transitions automatically every 4.5 seconds
    }

    // 4. OBSERVE ACTIVE SLIDES FOR THEME COLOR SHIFTS & GPU ANIMATION PAUSING
    const slideObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            entry.target.classList.toggle('is-active', entry.isIntersecting);

            if (entry.isIntersecting) {
                const activeTheme = entry.target.getAttribute('data-theme');
                if (activeTheme) {
                    body.setAttribute('data-active-theme', activeTheme);
                }

                // If Barat section is entered, start step-by-step auto story transitions
                if (entry.target.id === 'baratSection') {
                    switchBaratStep(1);
                    startBaratStoryCycle();
                } else if (baratAutoAdvanceTimer) {
                    clearInterval(baratAutoAdvanceTimer);
                }
            }
        });
    }, {
        root: container,
        threshold: 0.1
    });

    storySlides.forEach(slide => slideObserver.observe(slide));

    // 5. LIVE EVENT COUNTDOWNS
    const countdownWidgets = document.querySelectorAll('.slide-countdown-box');

    function updateAllCountdowns() {
        const currentTime = new Date().getTime();

        countdownWidgets.forEach(widget => {
            const eventTimeStr = widget.getAttribute('data-event-time');
            const eventTime = new Date(eventTimeStr).getTime();
            const diff = eventTime - currentTime;

            if (diff > 0) {
                const days = Math.floor(diff / (1000 * 60 * 60 * 24));
                const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                const mins = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
                const secs = Math.floor((diff % (1000 * 60)) / 1000);

                widget.querySelector('.val.days').textContent = String(days).padStart(2, '0');
                widget.querySelector('.val.hours').textContent = String(hours).padStart(2, '0');
                widget.querySelector('.val.mins').textContent = String(mins).padStart(2, '0');
                widget.querySelector('.val.secs').textContent = String(secs).padStart(2, '0');
            } else {
                widget.querySelector('.val.days').textContent = '00';
                widget.querySelector('.val.hours').textContent = '00';
                widget.querySelector('.val.mins').textContent = '00';
                widget.querySelector('.val.secs').textContent = '00';
            }
        });
    }

    updateAllCountdowns();
    setInterval(updateAllCountdowns, 1000);

    // 6. LIGHTWEIGHT CANVAS PARTICLES (OPTIMIZED FOR MOBILE GPU)
    const canvas = document.getElementById('ambientCanvas');
    if (canvas) {
        const ctx = canvas.getContext('2d', { alpha: true });
        let w = canvas.width = window.innerWidth;
        let h = canvas.height = window.innerHeight;

        window.addEventListener('resize', () => {
            w = canvas.width = window.innerWidth;
            h = canvas.height = window.innerHeight;
        }, { passive: true });

        const particles = [];
        const isMobile = window.innerWidth < 768;
        const count = isMobile ? 14 : 26;

        for (let i = 0; i < count; i++) {
            particles.push({
                x: Math.random() * w,
                y: Math.random() * h,
                size: Math.random() * 2.5 + 1,
                speedY: Math.random() * 0.6 + 0.25,
                speedX: (Math.random() - 0.5) * 0.4,
                opacity: Math.random() * 0.55 + 0.2
            });
        }

        function renderCanvas() {
            if (!document.hidden) {
                ctx.clearRect(0, 0, w, h);
                const activeTheme = body.getAttribute('data-active-theme') || 'hero';
                
                let color = 'rgba(250, 225, 156,';
                if (activeTheme === 'mehndi') color = 'rgba(234, 179, 8,';
                else if (activeTheme === 'barat') color = 'rgba(225, 29, 72,';
                else if (activeTheme === 'walima') color = 'rgba(56, 189, 248,';

                for (let i = 0; i < particles.length; i++) {
                    const p = particles[i];
                    p.y += p.speedY;
                    p.x += p.speedX;
                    if (p.y > h) { p.y = -5; p.x = Math.random() * w; }

                    ctx.fillStyle = `${color} ${p.opacity})`;
                    ctx.beginPath();
                    ctx.arc(p.x, p.y, p.size, 0, Math.PI * 2);
                    ctx.fill();
                }
            }
            requestAnimationFrame(renderCanvas);
        }

        renderCanvas();
    }

});
