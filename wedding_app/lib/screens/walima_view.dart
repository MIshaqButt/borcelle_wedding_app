import 'package:flutter/material.dart';
import '../models/wedding_model.dart';
import '../theme/app_theme.dart';
import '../widgets/photo_lightbox.dart';

class WalimaView extends StatelessWidget {
  final WeddingEvent event;

  const WalimaView({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.walimaDarkBg,
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
                  color: AppTheme.walimaGold.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.walimaGold),
                ),
                child: const Text(
                  '🕊️ DAY 3 • BLESSED RECEPTION',
                  style: TextStyle(
                    color: AppTheme.walimaGold,
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
                color: const Color(0xFFF1F5F9),
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
            const SizedBox(height: 20),

            // Description
            Text(
              event.description,
              textAlign: TextAlign.center,
              style: AppTheme.bodyStyle(fontSize: 14, color: Colors.white70),
            ),
            const SizedBox(height: 24),

            // -------------------------------------------------------------
            // SPECIFIC PHOTO 1: GROOM AND BRIDE GRAND ENTRY IMAGE
            // -------------------------------------------------------------
            _buildWalimaPhotoCard(
              context,
              title: 'Groom & Bride Royal Entry',
              caption: 'Muhammad Ishaq & Pimra Ahmad walking under lighted floral arches and starlight sparklers',
              imageAsset: 'assets/images/walima_entry.jpg',
              tag: 'ROYAL ENTRY',
            ),
            const SizedBox(height: 20),

            // -------------------------------------------------------------
            // SPECIFIC PHOTO 2: RECEPTION BANQUET IMAGE
            // -------------------------------------------------------------
            _buildWalimaPhotoCard(
              context,
              title: 'Walima Reception Banquet Dinner',
              caption: 'Luxury ballroom dining with crystal chandeliers, floral centerpieces & candelabras',
              imageAsset: 'assets/images/walima_reception.jpg',
              tag: 'GRAND BANQUET',
            ),
            const SizedBox(height: 28),

            // RECEPTION SCHEDULE
            const Text(
              'RECEPTION SCHEDULE',
              style: TextStyle(
                color: AppTheme.walimaGold,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 12),

            ...event.schedule.map((item) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.cardDark,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppTheme.walimaGold.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppTheme.walimaGold.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppTheme.walimaGold),
                      ),
                      child: Text(
                        item.time,
                        style: const TextStyle(
                          color: AppTheme.walimaGold,
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

            // Dress Code Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.walimaGold.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppTheme.walimaGold.withOpacity(0.4)),
              ),
              child: Row(
                children: [
                  const Text('✨', style: TextStyle(fontSize: 26)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'SUGGESTED ATTIRE',
                          style: TextStyle(
                            color: AppTheme.walimaGold,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          event.dressCode,
                          style: const TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
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

  Widget _buildWalimaPhotoCard(
    BuildContext context, {
    required String title,
    required String caption,
    required String imageAsset,
    required String tag,
  }) {
    return GestureDetector(
      onTap: () {
        PhotoLightbox.show(
          context,
          imageAsset: imageAsset,
          title: title,
          caption: caption,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.cardDark,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppTheme.walimaGold.withOpacity(0.4)),
          boxShadow: [
            BoxShadow(
              color: AppTheme.walimaGold.withOpacity(0.15),
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
                    height: 210,
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
                        border: Border.all(color: AppTheme.walimaGold),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          color: AppTheme.walimaGold,
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
                    caption,
                    style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.4),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '🔍 Tap to view high-resolution photo',
                    style: TextStyle(color: AppTheme.walimaGold, fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
