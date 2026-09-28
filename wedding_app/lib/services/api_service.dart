import '../models/wedding_model.dart';
import '../config/wedding_config.dart';

class ApiService {
  // Return wedding core details directly from WeddingConfig (instant, 100% offline standalone)
  static Future<WeddingDetails> fetchWeddingDetails() async {
    return WeddingConfig.getWeddingDetails();
  }

  // Return all 3 events (Mehndi, Barat, Walima) directly from WeddingConfig
  static Future<List<WeddingEvent>> fetchEvents() async {
    return WeddingConfig.getEvents();
  }

  // Initial guest blessings list for the stream
  static Future<List<GuestWish>> fetchWishes() async {
    return [
      GuestWish(
        id: 1,
        author: 'Farhan & Family',
        relation: 'Uncle & Aunt',
        message: 'Barakallahu lakuma wa baraka alaikuma! May Allah fill your lives with barakah, love, and laughter. Congratulations to both families!',
        timestamp: '2026-09-27T10:00:00Z',
      ),
      GuestWish(
        id: 2,
        author: 'Usman Tariq',
        relation: 'Friend',
        message: 'Heartiest congratulations to my dear brother Muhammad Ishaq and bhabhi Pimra Ahmad! Counting down to the grand celebration!',
        timestamp: '2026-09-27T11:30:00Z',
      ),
    ];
  }
}
