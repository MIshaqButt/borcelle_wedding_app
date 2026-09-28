import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/wedding_model.dart';
import '../theme/app_theme.dart';
import '../widgets/photo_lightbox.dart';

class BaratView extends StatelessWidget {
  final WeddingEvent event;

  const BaratView({super.key, required this.event});

  Future<void> _openGoogleMaps(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.baratDarkBg,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Badge
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.baratCrimson.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.gold),
                ),
                child: const Text(
                  '👑 DAY 2 • THE MAIN CEREMONY',
                  style: TextStyle(
                    color: AppTheme.goldBright,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Title
            Text(
              event.title,
              textAlign: TextAlign.center,
              style: AppTheme.headingStyle(
                color: AppTheme.goldLight,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              event.date,
              textAlign: TextAlign.center,
              style: AppTheme.bodyStyle(
                color: Colors.white70,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 24),

            // -------------------------------------------------------------
            // SPECIFIC PHOTO 1: NIKAH CEREMONY PICTURE
            // -------------------------------------------------------------
            _buildCeremonyCard(
              context,
              title: 'Sacred Nikah Ceremony',
              subtitle: 'Signing of the Nikah Nama under the solemn presence of elders & family',
              imageAsset: 'assets/images/nikah.jpg',
              tag: 'SACRED UNION',
              accentColor: AppTheme.gold,
            ),
            const SizedBox(height: 20),

            // -------------------------------------------------------------
            // SPECIFIC PHOTO 2: BARAT WELCOME PICTURE
            // -------------------------------------------------------------
            _buildCeremonyCard(
              context,
              title: 'Barat Arrival & Welcome',
              subtitle: 'Groom welcomed with fragrant rose petal showers & floral garlands',
              imageAsset: 'assets/images/barat_welcome.jpg',
              tag: 'GRAND WELCOME',
              accentColor: AppTheme.baratCrimson,
            ),
            const SizedBox(height: 20),

            // -------------------------------------------------------------
            // SPECIFIC PHOTO 3: EMOTIONAL RUKHSATI PICTURE
            // -------------------------------------------------------------
            _buildCeremonyCard(
              context,
              title: 'Emotional Rukhsati',
              subtitle: 'Tears of joy & farewell under the Holy Quran with heartfelt prayers',
              imageAsset: 'assets/images/rukhsati.jpg',
              tag: 'BIDDING FAREWELL',
              accentColor: Colors.amber.shade700,
            ),
            const SizedBox(height: 20),

            // -------------------------------------------------------------
            // SPECIFIC PHOTO 4: BHANGRA DANCE CELEBRATION
            // -------------------------------------------------------------
            _buildCeremonyCard(
              context,
              title: 'Bhangra Dance & Celebration',
              subtitle: 'Joyful dances and celebration welcoming the Barat procession',
              imageAsset: 'assets/images/punjabi_dance.jpg',
              tag: 'BHANGRA JOY',
              accentColor: AppTheme.mehndiYellow,
            ),
            const SizedBox(height: 24),

            // Decorated Wedding Car Highlight
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.cardDark,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.gold.withOpacity(0.4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '🚗 DECORATED BARAT CAR',
                    style: TextStyle(
                      color: AppTheme.goldLight,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/barat_car.jpg',
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // BARAT TIMETABLE: 1PM Arrival, 2PM Lunch, 4PM Rukhsati
            const Text(
              'OFFICIAL CEREMONY TIMETABLE',
              style: TextStyle(
                color: AppTheme.goldLight,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 12),

            _buildTimeSlot('01:00 PM', 'Barat Arrival', 'Grand welcome of groom Muhammad Ishaq & family'),
            _buildTimeSlot('02:00 PM', 'Royal Lunch', 'Traditional royal feast & hospitable banquet'),
            _buildTimeSlot('04:00 PM', 'Emotional Rukhsati', 'Dua and farewell under the shadow of the Holy Quran'),

            const SizedBox(height: 24),

            // KOH-E-NOOR MARQUEE VENUE & GOOGLE MAPS
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.baratMaroon,
                    Colors.black87,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.gold),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.baratCrimson.withOpacity(0.4),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Row(
                    children: [
                      Text('🏛️', style: TextStyle(fontSize: 26)),
                      SizedBox(width: 10),
                      Text(
                        'OFFICIAL VENUE',
                        style: TextStyle(
                          color: AppTheme.goldLight,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event.venueName ?? 'Koh-e-Noor Marquee',
                    style: AppTheme.headingStyle(fontSize: 24, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event.venueCity ?? 'Farooqabad, Punjab',
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 18),

                  // Open Google Maps Button
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF10B981),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    icon: const Icon(Icons.map_outlined, color: Colors.white),
                    label: Text(
                      'Open ${event.venueName ?? "Venue"} in Google Maps',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    onPressed: () {
                      _openGoogleMaps(event.mapUrl ?? 'https://maps.app.goo.gl/Uty8hrCb7oQ5rmFr6');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildCeremonyCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String imageAsset,
    required String tag,
    required Color accentColor,
  }) {
    return GestureDetector(
      onTap: () {
        PhotoLightbox.show(
          context,
          imageAsset: imageAsset,
          title: title,
          caption: subtitle,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.cardDark,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: accentColor.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
              color: accentColor.withOpacity(0.15),
              blurRadius: 15,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
              child: Stack(
                children: [
                  Image.asset(
                    imageAsset,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: accentColor),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: accentColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.headingStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.4),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '🔍 Tap to view high-resolution photo',
                    style: TextStyle(color: AppTheme.goldLight, fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlot(String time, String title, String desc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.gold.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.baratCrimson,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.gold),
            ),
            child: Text(
              time,
              style: const TextStyle(
                color: AppTheme.goldBright,
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
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  desc,
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
  }
}
