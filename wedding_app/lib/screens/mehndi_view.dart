import 'package:flutter/material.dart';
import '../models/wedding_model.dart';
import '../theme/app_theme.dart';
import '../widgets/photo_lightbox.dart';

class MehndiView extends StatefulWidget {
  final WeddingEvent event;

  const MehndiView({super.key, required this.event});

  @override
  State<MehndiView> createState() => _MehndiViewState();
}

class _MehndiViewState extends State<MehndiView> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  bool _isMusicPlaying = true;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.mehndiDarkBg,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Badge
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.mehndiAmber.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.mehndiAmber.withOpacity(0.6)),
                ),
                child: Text(
                  widget.event.dayLabel.toUpperCase(),
                  style: const TextStyle(
                    color: AppTheme.mehndiYellow,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Event Title
            Text(
              widget.event.title,
              textAlign: TextAlign.center,
              style: AppTheme.headingStyle(
                color: AppTheme.mehndiYellow,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.event.date,
              textAlign: TextAlign.center,
              style: AppTheme.bodyStyle(
                color: Colors.white70,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20),

            // Animated Dholak Music Player Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.mehndiAmber.withOpacity(0.25),
                    Colors.black.withOpacity(0.4),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.mehndiYellow.withOpacity(0.4)),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.mehndiAmber.withOpacity(0.2),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Animated Dhol Icon / Disc
                  AnimatedBuilder(
                    animation: _pulseController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _isMusicPlaying ? 1.0 + (_pulseController.value * 0.08) : 1.0,
                        child: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppTheme.mehndiYellow, width: 2),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/punjabi_dhol.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'MEHNDI MUSIC SOUNDTRACK',
                          style: TextStyle(
                            color: AppTheme.mehndiYellow,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.event.musicTitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      _isMusicPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                      color: AppTheme.mehndiYellow,
                      size: 38,
                    ),
                    onPressed: () {
                      setState(() {
                        _isMusicPlaying = !_isMusicPlaying;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Description
            Text(
              widget.event.description,
              textAlign: TextAlign.center,
              style: AppTheme.bodyStyle(fontSize: 14, color: Colors.white70),
            ),
            const SizedBox(height: 24),

            // Featured Punjabi Dancers & Dholak Visuals
            const Text(
              'MEHNDI FESTIVITIES & DANCE',
              style: TextStyle(
                color: AppTheme.mehndiYellow,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 12),

            // Punjabi Dancers Card
            GestureDetector(
              onTap: () {
                PhotoLightbox.show(
                  context,
                  imageAsset: 'assets/images/punjabi_dance.jpg',
                  title: 'Bhangra & Giddha Celebrations',
                  caption: 'Joyous Punjabi dancers celebrating the Mehndi night',
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset(
                      'assets/images/punjabi_dance.jpg',
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black.withOpacity(0.85)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '💃 Punjabi Giddha & Bhangra Dance',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Tap to view in full resolution',
                            style: TextStyle(color: AppTheme.mehndiYellow, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Traditional Dhol Drum Card
            GestureDetector(
              onTap: () {
                PhotoLightbox.show(
                  context,
                  imageAsset: 'assets/images/punjabi_dhol.jpg',
                  title: 'Traditional Wedding Dholak',
                  caption: 'Adorned with fresh marigolds and colorful silk tassels',
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset(
                      'assets/images/punjabi_dhol.jpg',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black.withOpacity(0.85)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        '🥁 Traditional Punjabi Dholak',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),

            // Schedule Section
            const Text(
              'PROGRAM OF EVENTS',
              style: TextStyle(
                color: AppTheme.mehndiYellow,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 12),

            ...widget.event.schedule.map((item) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.cardDark,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppTheme.mehndiAmber.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppTheme.mehndiAmber.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppTheme.mehndiYellow.withOpacity(0.4)),
                      ),
                      child: Text(
                        item.time,
                        style: const TextStyle(
                          color: AppTheme.mehndiYellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item.desc,
                            style: const TextStyle(
                              color: Colors.white60,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),

            const SizedBox(height: 16),

            // Dress Code Badge
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.mehndiAmber.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppTheme.mehndiAmber.withOpacity(0.4)),
              ),
              child: Row(
                children: [
                  const Text('🎨', style: TextStyle(fontSize: 26)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'SUGGESTED DRESS CODE',
                          style: TextStyle(
                            color: AppTheme.mehndiYellow,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.event.dressCode,
                          style: const TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
