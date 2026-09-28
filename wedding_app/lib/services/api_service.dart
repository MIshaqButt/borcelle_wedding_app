import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/wedding_model.dart';
import '../config/wedding_config.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:5050/api';

  // Fetch wedding core details (uses backend if available, otherwise WeddingConfig)
  static Future<WeddingDetails> fetchWeddingDetails() async {
    try {
      final res = await http.get(Uri.parse('$baseUrl/wedding')).timeout(const Duration(seconds: 3));
      if (res.statusCode == 200) {
        return WeddingDetails.fromJson(jsonDecode(res.body));
      }
    } catch (e) {
      // Fallback offline data from WeddingConfig
    }
    return WeddingConfig.getWeddingDetails();
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
      // Fallback offline data from WeddingConfig
    }
    return WeddingConfig.getEvents();
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
