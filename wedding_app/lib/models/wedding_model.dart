class WeddingDetails {
  final String id;
  final String groom;
  final String bride;
  final String dates;
  final String bismillahArabic;
  final String quranVerse;
  final String surahRef;
  final String parentsBlessing;

  WeddingDetails({
    required this.id,
    required this.groom,
    required this.bride,
    required this.dates,
    required this.bismillahArabic,
    required this.quranVerse,
    required this.surahRef,
    required this.parentsBlessing,
  });

  factory WeddingDetails.fromJson(Map<String, dynamic> json) {
    return WeddingDetails(
      id: json['id'] ?? 'ishaq-pimra-2026',
      groom: json['groom'] ?? 'Muhammad Ishaq',
      bride: json['bride'] ?? 'Pimra Ahmad',
      dates: json['dates'] ?? '20 - 22 November 2026',
      bismillahArabic: json['bismillahArabic'] ?? 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
      quranVerse: json['quranVerse'] ?? '',
      surahRef: json['surahRef'] ?? '',
      parentsBlessing: json['parentsBlessing'] ?? '',
    );
  }
}

class WeddingEvent {
  final String id;
  final String title;
  final String dayLabel;
  final String date;
  final String themeColorHex;
  final String musicTitle;
  final String description;
  final String dressCode;
  final String? venueName;
  final String? venueCity;
  final String? mapUrl;
  final List<EventScheduleItem> schedule;
  final List<GalleryPhoto> gallery;

  WeddingEvent({
    required this.id,
    required this.title,
    required this.dayLabel,
    required this.date,
    required this.themeColorHex,
    required this.musicTitle,
    required this.description,
    required this.dressCode,
    this.venueName,
    this.venueCity,
    this.mapUrl,
    required this.schedule,
    required this.gallery,
  });

  factory WeddingEvent.fromJson(Map<String, dynamic> json) {
    final venue = json['venue'] as Map<String, dynamic>?;
    return WeddingEvent(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      dayLabel: json['dayLabel'] ?? '',
      date: json['date'] ?? '',
      themeColorHex: json['themeColor'] ?? '#881337',
      musicTitle: json['musicTitle'] ?? '',
      description: json['description'] ?? '',
      dressCode: json['dressCode'] ?? '',
      venueName: venue?['name'],
      venueCity: venue?['city'],
      mapUrl: venue?['mapUrl'],
      schedule: (json['schedule'] as List<dynamic>? ?? [])
          .map((i) => EventScheduleItem.fromJson(i))
          .toList(),
      gallery: (json['gallery'] as List<dynamic>? ?? [])
          .map((i) => GalleryPhoto.fromJson(i))
          .toList(),
    );
  }
}

class EventScheduleItem {
  final String time;
  final String title;
  final String desc;

  EventScheduleItem({
    required this.time,
    required this.title,
    required this.desc,
  });

  factory EventScheduleItem.fromJson(Map<String, dynamic> json) {
    return EventScheduleItem(
      time: json['time'] ?? '',
      title: json['title'] ?? '',
      desc: json['desc'] ?? '',
    );
  }
}

class GalleryPhoto {
  final String title;
  final String asset;
  final String caption;

  GalleryPhoto({
    required this.title,
    required this.asset,
    required this.caption,
  });

  factory GalleryPhoto.fromJson(Map<String, dynamic> json) {
    return GalleryPhoto(
      title: json['title'] ?? '',
      asset: json['asset'] ?? '',
      caption: json['caption'] ?? '',
    );
  }
}

class GuestWish {
  final dynamic id;
  final String author;
  final String relation;
  final String message;
  final String timestamp;

  GuestWish({
    required this.id,
    required this.author,
    required this.relation,
    required this.message,
    required this.timestamp,
  });

  factory GuestWish.fromJson(Map<String, dynamic> json) {
    return GuestWish(
      id: json['id'] ?? DateTime.now().millisecondsSinceEpoch,
      author: json['author'] ?? 'Well-wisher',
      relation: json['relation'] ?? 'Family',
      message: json['message'] ?? '',
      timestamp: json['timestamp'] ?? '',
    );
  }
}
