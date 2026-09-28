import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/wedding_model.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:5050/api';

  // Fetch wedding core details
  static Future<WeddingDetails> fetchWeddingDetails() async {
    try {
      final res = await http.get(Uri.parse('$baseUrl/wedding')).timeout(const Duration(seconds: 3));
      if (res.statusCode == 200) {
        return WeddingDetails.fromJson(jsonDecode(res.body));
      }
    } catch (e) {
      // Fallback offline data
    }
    return WeddingDetails(
      id: 'ishaq-pimra-2026',
      groom: 'Muhammad Ishaq',
      bride: 'Pimra Ahmad',
      dates: '20 - 22 November 2026',
      bismillahArabic: 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
      quranVerse: 'And of His signs is that He created for you from yourselves mates that you may find tranquility in them; and He placed between you affection and mercy.',
      surahRef: 'Surah Ar-Rum [30:21]',
      parentsBlessing: 'With the grace of Almighty Allah & the blessings of our parents, we invite you to celebrate our wedding union.',
    );
  }

  // Fetch all 3 events (Mehndi, Barat, Walima)
  static Future<List<WeddingEvent>> fetchEvents() async {
    try {
      final res = await http.get(Uri.parse('$baseUrl/events')).timeout(const Duration(seconds: 3));
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        return data.map((json) => WeddingEvent.fromJson(json)).toList();
      }
    } catch (e) {
      // Fallback offline data
    }

    return [
      WeddingEvent(
        id: 'mehndi',
        title: 'Rasm-e-Mehndi & Sangeet',
        dayLabel: 'Day 1 • Festive Night',
        date: 'Friday, 20 November 2026',
        themeColorHex: '#D97706',
        musicTitle: 'Festive Dholak & Traditional Tappe',
        description: 'An auspicious evening filled with fragrant henna, lively dholak rhythms, and cheerful celebrations.',
        dressCode: 'Marigold Yellow, Parrot Green & Festive Florals',
        schedule: [
          EventScheduleItem(time: '07:00 PM', title: 'Rasm-e-Hina & Dholak Beats', desc: 'Henna ritual and traditional songs'),
          EventScheduleItem(time: '08:30 PM', title: 'Festive Dinner & Sangeet', desc: 'Traditional food & musical performances'),
        ],
        gallery: [
          GalleryPhoto(title: 'Punjabi Dholak', asset: 'assets/images/punjabi_dhol.jpg', caption: 'Traditional dholak with marigold garlands'),
          GalleryPhoto(title: 'Bhangra & Giddha Dancers', asset: 'assets/images/punjabi_dance.jpg', caption: 'Joyful Punjabi dancers celebrating the night'),
        ],
      ),
      WeddingEvent(
        id: 'barat',
        title: 'The Grand Royal Barat',
        dayLabel: 'Day 2 • The Main Ceremony',
        date: 'Saturday, 21 November 2026',
        themeColorHex: '#881337',
        musicTitle: 'Royal Shehnai & Barat March',
        description: 'The sacred Nikah union, grand feast, and emotional Rukhsati of Muhammad Ishaq & Pimra Ahmad.',
        dressCode: 'Royal Sherwanis, Crimson Lehengas & Formal Attire',
        venueName: 'Koh-e-Noor Marquee',
        venueCity: 'Farooqabad, Punjab',
        mapUrl: 'https://maps.app.goo.gl/Uty8hrCb7oQ5rmFr6',
        schedule: [
          EventScheduleItem(time: '01:00 PM', title: 'Barat Arrival & Welcome', desc: 'Grand welcome of Groom Muhammad Ishaq with rose petal shower'),
          EventScheduleItem(time: '01:30 PM', title: 'Sacred Nikah Ceremony', desc: 'Signing the marriage contract in presence of elders'),
          EventScheduleItem(time: '02:00 PM', title: 'Royal Lunch', desc: 'Traditional lavish wedding banquet'),
          EventScheduleItem(time: '04:00 PM', title: 'Emotional Rukhsati', desc: 'Farewell under the Holy Quran with heartfelt prayers'),
        ],
        gallery: [
          GalleryPhoto(title: 'Barat Welcome Ceremony', asset: 'assets/images/barat_welcome.jpg', caption: 'Grand welcome of groom with rose petal shower'),
          GalleryPhoto(title: 'Sacred Nikah Ceremony', asset: 'assets/images/nikah.jpg', caption: 'Groom & bride signing the Nikah Nama'),
          GalleryPhoto(title: 'Emotional Rukhsati', asset: 'assets/images/rukhsati.jpg', caption: 'Tears of joy & farewell under the Holy Quran'),
          GalleryPhoto(title: 'Bhangra Celebration', asset: 'assets/images/punjabi_dance.jpg', caption: 'Joyous celebrations during the Barat'),
          GalleryPhoto(title: 'Decorated Barat Car', asset: 'assets/images/barat_car.jpg', caption: 'Vintage wedding car decorated with fresh flowers'),
        ],
      ),
      WeddingEvent(
        id: 'walima',
        title: 'Walima Banquet Reception',
        dayLabel: 'Day 3 • Blessed Feast',
        date: 'Sunday, 22 November 2026',
        themeColorHex: '#4B5563',
        musicTitle: 'Romantic Classical Flute & Sitar',
        description: 'Expressing gratitude to Almighty Allah and hosting guests for an elegant reception dinner.',
        dressCode: 'Pastel Champagne, Tuxedos & Elegant Maxi Formals',
        schedule: [
          EventScheduleItem(time: '07:30 PM', title: 'Grand Couple Entry & Reception', desc: 'Newlyweds enter the ballroom under lighted floral arches'),
          EventScheduleItem(time: '08:30 PM', title: 'Gourmet Banquet Dinner', desc: 'Celebratory royal dinner'),
        ],
        gallery: [
          GalleryPhoto(title: 'Grand Couple Entry', asset: 'assets/images/walima_entry.jpg', caption: 'Groom & bride royal entry into the ballroom'),
          GalleryPhoto(title: 'Reception Banquet', asset: 'assets/images/walima_reception.jpg', caption: 'Lavish ballroom dinner with crystal chandeliers'),
        ],
      ),
    ];
  }

  // Fetch guest wishes
  static Future<List<GuestWish>> fetchWishes() async {
    try {
      final res = await http.get(Uri.parse('$baseUrl/wishes')).timeout(const Duration(seconds: 3));
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        return data.map((json) => GuestWish.fromJson(json)).toList();
      }
    } catch (e) {
      // Fallback
    }
    return [
      GuestWish(
        id: 1,
        author: 'Farhan & Family',
        relation: 'Uncle & Aunt',
        message: 'Barakallahu lakuma wa baraka alaikuma! May Allah fill your lives with barakah, love, and laughter. Congratulations Ishaq & Pimra!',
        timestamp: '2026-09-27T10:00:00Z',
      ),
      GuestWish(
        id: 2,
        author: 'Usman Tariq',
        relation: 'Friend',
        message: 'Heartiest congratulations to my dear brother Muhammad Ishaq and bhabhi Pimra Ahmad! Looking forward to the Barat lunch at Koh-e-Noor!',
        timestamp: '2026-09-27T11:30:00Z',
      ),
    ];
  }

  // Post a new wish
  static Future<bool> postWish(String author, String relation, String message) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/wishes'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'author': author,
          'relation': relation,
          'message': message,
        }),
      );
      return res.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  // Submit RSVP
  static Future<bool> submitRsvp({
    required String name,
    required String phone,
    required bool attendingMehndi,
    required bool attendingBarat,
    required bool attendingWalima,
    required int guestCount,
    required String notes,
  }) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/rsvp'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'phone': phone,
          'attendingMehndi': attendingMehndi,
          'attendingBarat': attendingBarat,
          'attendingWalima': attendingWalima,
          'guestCount': guestCount,
          'notes': notes,
        }),
      );
      return res.statusCode == 201;
    } catch (e) {
      return false;
    }
  }
}
