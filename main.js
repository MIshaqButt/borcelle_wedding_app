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

    // 1. WAX SEAL INTRO HANDLER
    function unlockInvitation() {
        if (!envelopeOverlay.classList.contains('opened')) {
            envelopeOverlay.classList.add('opened');
            playAudioSafely();
        }
    }

    if (openEnvelopeBtn) {
        openEnvelopeBtn.addEventListener('click', unlockInvitation);
    }

    // Scroll wheel trigger on envelope
    window.addEventListener('wheel', (e) => {
        if (e.deltaY > 15 && !envelopeOverlay.classList.contains('opened')) {
            unlockInvitation();
        }
    }, { passive: true });

    // Touch swipe trigger on envelope
    let touchStartY = 0;
    window.addEventListener('touchstart', (e) => {
        touchStartY = e.touches[0].clientY;
    }, { passive: true });

    window.addEventListener('touchend', (e) => {
        const diff = touchStartY - e.changedTouches[0].clientY;
        if (diff > 35 && !envelopeOverlay.classList.contains('opened')) {
            unlockInvitation();
        }
    }, { passive: true });

    // 2. AUDIO MANAGEMENT
    function playAudioSafely() {
        if (!weddingBgAudio) return;
        weddingBgAudio.volume = 0.5;
        weddingBgAudio.play().then(() => {
            isMusicPlaying = true;
            musicToggle.classList.add('playing');
            musicLabel.textContent = 'Playing';
        }).catch(() => {
            isMusicPlaying = false;
            musicToggle.classList.remove('playing');
            musicLabel.textContent = 'Music';
        });
    }

    if (musicToggle) {
        musicToggle.addEventListener('click', () => {
            if (!weddingBgAudio) return;
            if (isMusicPlaying) {
                weddingBgAudio.pause();
                isMusicPlaying = false;
                musicToggle.classList.remove('playing');
                musicLabel.textContent = 'Muted';
            } else {
                weddingBgAudio.play().then(() => {
                    isMusicPlaying = true;
                    musicToggle.classList.add('playing');
                    musicLabel.textContent = 'Playing';
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

    // 4. OBSERVE ACTIVE SLIDES FOR THEME COLOR SHIFTS & BARAT STORY SEQUENCE
    const slideObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
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
        threshold: 0.3
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
                const mins = Math.floor((diff % (1000 * 60)) / (1000 * 60));
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

    // 6. CANVAS PARTICLES (PETALS & GOLD SHIMMER)
    const canvas = document.getElementById('ambientCanvas');
    if (canvas) {
        const ctx = canvas.getContext('2d');
        let w = canvas.width = window.innerWidth;
        let h = canvas.height = window.innerHeight;

        window.addEventListener('resize', () => {
            w = canvas.width = window.innerWidth;
            h = canvas.height = window.innerHeight;
        });

        const particles = [];
        const count = 35;

        for (let i = 0; i < count; i++) {
            particles.push({
                x: Math.random() * w,
                y: Math.random() * h,
                size: Math.random() * 3 + 1,
                speedY: Math.random() * 0.7 + 0.3,
                speedX: (Math.random() - 0.5) * 0.5,
                opacity: Math.random() * 0.6 + 0.2
            });
        }

        function renderCanvas() {
            ctx.clearRect(0, 0, w, h);
            const activeTheme = body.getAttribute('data-active-theme') || 'hero';
            
            let color = 'rgba(250, 225, 156,';
            if (activeTheme === 'mehndi') color = 'rgba(234, 179, 8,';
            else if (activeTheme === 'barat') color = 'rgba(225, 29, 72,';
            else if (activeTheme === 'walima') color = 'rgba(56, 189, 248,';

            particles.forEach(p => {
                p.y += p.speedY;
                p.x += p.speedX;
                if (p.y > h) { p.y = -5; p.x = Math.random() * w; }

                ctx.fillStyle = `${color} ${p.opacity})`;
                ctx.beginPath();
                ctx.arc(p.x, p.y, p.size, 0, Math.PI * 2);
                ctx.fill();
            });

            requestAnimationFrame(renderCanvas);
        }

        renderCanvas();
    }

});
