import '../models/wedding_model.dart';

/// ============================================================================
/// 💍 WEDDING MASTER CONFIGURATION FILE
/// ============================================================================
/// You can customize all wedding details in this single file:
/// - Groom & Bride names
/// - Wedding dates & Quranic blessings
/// - Exact countdown timer target date/time
/// - Mehndi, Barat, and Walima events:
///     - Dates, timings, day labels
///     - Venue names, cities, Google Maps links
///     - Schedule items (arrival, lunch, rukhsati, dinner, etc.)
///     - Dress codes, music titles, descriptions
///     - Photos and captions
/// - RSVP contact information
/// ============================================================================

class WeddingConfig {
  // ---------------------------------------------------------------------------
  // 1. COUPLE & FAMILY INFORMATION
  // ---------------------------------------------------------------------------
  static const String groomName = 'Danish Rafique';
  static const String brideName = 'Mahnoor Khadim';
  static const String weddingDatesHeader = '19 - 21 November 2026';

  // Islamic Blessings & Quranic Reference
  static const String bismillahArabic =
      'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ';
  static const String quranVerse =
      'And of His signs is that He created for you from yourselves mates that you may find tranquility in them; and He placed between you affection and mercy.';
  static const String surahReference = 'Surah Ar-Rum [30:21]';
  static const String parentsBlessing =
      'With the grace of Almighty Allah & the blessings of our parents, we invite you to celebrate our wedding union.';

  // ---------------------------------------------------------------------------
  // 2. LIVE COUNTDOWN TIMER TARGET
  // Set the exact date & time for the countdown clock on the home screen.
  // Format: DateTime(YEAR, MONTH, DAY, HOUR_IN_24H, MINUTE)
  // ---------------------------------------------------------------------------
  static final DateTime countdownTarget = DateTime(
    2026,
    11,
    21,
    13,
    0,
  ); // 21 Nov 2026, 1:00 PM

  // ---------------------------------------------------------------------------
  // 3. WHATSAPP & RSVP CONTACT INFORMATION
  // Duas, blessings, and RSVPs from the app are sent directly to this WhatsApp!
  // Format: International format digits without '+' or spaces (e.g. '923001234567')
  // ---------------------------------------------------------------------------
  static const String whatsappNumber =
      '+923406206965'; // 👈 Enter your WhatsApp number here
  static const String rsvpContactName = groomName;
  static const String rsvpPhone = '+92 340 6206965';
  static const String rsvpEmail = 'ishaq.info1@gmail.com';

  // ---------------------------------------------------------------------------
  // 4. EVENT 1: RASM-E-MEHNDI & SANGEET
  // ---------------------------------------------------------------------------
  static const String mehndiTitle = 'Rasm-e-Mehndi & Sangeet';
  static const String mehndiDayLabel = 'Day 1 • Festive Night';
  static const String mehndiDate = 'Friday, 20 November 2026';
  static const String mehndiThemeColor = '#D97706'; // Vibrant Amber / Marigold
  static const String mehndiMusicTitle = 'Festive Dholak & Traditional Tappe';
  static const String mehndiDescription =
      'An auspicious evening filled with fragrant henna, lively dholak rhythms, and cheerful celebrations.';
  static const String mehndiDressCode =
      'Marigold Yellow, Parrot Green & Festive Florals';
  static const String mehndiVenueName = 'Royal Palace Hall';
  static const String mehndiVenueCity = 'Farooqabad, Punjab';
  static const String mehndiMapUrl =
      'https://maps.app.goo.gl/Uty8hrCb7oQ5rmFr6';

  static final List<EventScheduleItem> mehndiSchedule = [
    EventScheduleItem(
      time: '07:00 PM',
      title: 'Rasm-e-Hina & Dholak Beats',
      desc: 'Henna ritual, traditional wedding songs, and beat of the dholak',
    ),
    EventScheduleItem(
      time: '08:30 PM',
      title: 'Festive Dinner & Sangeet',
      desc: 'Traditional Punjabi delicacies & lively family dance performances',
    ),
  ];

  static final List<GalleryPhoto> mehndiGallery = [
    GalleryPhoto(
      title: 'Punjabi Dholak',
      asset: 'assets/images/punjabi_dhol.jpg',
      caption: 'Traditional dholak decorated with fresh marigold garlands',
    ),
    GalleryPhoto(
      title: 'Bhangra & Giddha Dancers',
      asset: 'assets/images/punjabi_dance.jpg',
      caption: 'Joyful Punjabi dancers celebrating the festive night',
    ),
  ];

  // ---------------------------------------------------------------------------
  // 5. EVENT 2: THE GRAND ROYAL BARAT (MAIN CEREMONY)
  // ---------------------------------------------------------------------------
  static const String baratTitle = 'The Grand Royal Barat';
  static const String baratDayLabel = 'Day 2 • The Main Ceremony';
  static const String baratDate = 'Saturday, 21 November 2026';
  static const String baratThemeColor = '#881337'; // Royal Crimson
  static const String baratMusicTitle = 'Royal Shehnai & Barat March';
  static const String baratDescription =
      'The sacred Nikah union, grand feast, and emotional Rukhsati of $groomName & $brideName.';
  static const String baratDressCode =
      'Royal Sherwanis, Crimson Lehengas & Formal Attire';

  // Venue & Google Maps Navigation
  static const String baratVenueName = 'Koh-e-Noor Marquee';
  static const String baratVenueCity = 'Farooqabad, Punjab, Pakistan';
  static const String baratMapUrl = 'https://maps.app.goo.gl/Uty8hrCb7oQ5rmFr6';

  // Detailed Timetable
  static final List<EventScheduleItem> baratSchedule = [
    EventScheduleItem(
      time: '01:00 PM',
      title: 'Barat Arrival & Welcome',
      desc: 'Grand welcome of Groom $groomName with rose petal shower',
    ),
    EventScheduleItem(
      time: '01:30 PM',
      title: 'Sacred Nikah Ceremony',
      desc: 'Signing the marriage contract in presence of family and elders',
    ),
    EventScheduleItem(
      time: '02:00 PM',
      title: 'Royal Lunch',
      desc: 'Traditional lavish wedding feast and celebratory banquet',
    ),
    EventScheduleItem(
      time: '04:00 PM',
      title: 'Emotional Rukhsati',
      desc:
          'Farewell under the Holy Quran with heartfelt prayers and blessings',
    ),
  ];

  static final List<GalleryPhoto> baratGallery = [
    GalleryPhoto(
      title: 'Barat Welcome Ceremony',
      asset: 'assets/images/barat_welcome.jpg',
      caption: 'Grand welcome of the groom with rose petal shower',
    ),
    GalleryPhoto(
      title: 'Sacred Nikah Ceremony',
      asset: 'assets/images/nikah.jpg',
      caption: 'Groom & bride signing the Nikah Nama with Islamic blessings',
    ),
    GalleryPhoto(
      title: 'Emotional Rukhsati',
      asset: 'assets/images/rukhsati.jpg',
      caption: 'Tears of joy & farewell under the Holy Quran',
    ),
    GalleryPhoto(
      title: 'Bhangra Celebration',
      asset: 'assets/images/punjabi_dance.jpg',
      caption: 'Joyous celebrations and dance during the Barat',
    ),
    GalleryPhoto(
      title: 'Decorated Barat Car',
      asset: 'assets/images/barat_car.jpg',
      caption: 'Vintage wedding car decorated with fresh exotic flowers',
    ),
  ];

  // ---------------------------------------------------------------------------
  // 6. EVENT 3: WALIMA BANQUET RECEPTION
  // ---------------------------------------------------------------------------
  static const String walimaTitle = 'Walima Banquet Reception';
  static const String walimaDayLabel = 'Day 3 • Blessed Feast';
  static const String walimaDate = 'Sunday, 22 November 2026';
  static const String walimaThemeColor = '#4B5563'; // Champagne / Pearl Gray
  static const String walimaMusicTitle = 'Romantic Classical Flute & Sitar';
  static const String walimaDescription =
      'Expressing gratitude to Almighty Allah and hosting guests for an elegant reception dinner.';
  static const String walimaDressCode =
      'Pastel Champagne, Tuxedos & Elegant Maxi Formals';

  // Venue & Google Maps Navigation
  static const String walimaVenueName = 'Koh-e-Noor Marquee (Grand Ballroom)';
  static const String walimaVenueCity = 'Farooqabad, Punjab, Pakistan';
  static const String walimaMapUrl =
      'https://maps.app.goo.gl/Uty8hrCb7oQ5rmFr6';

  // Detailed Timetable
  static final List<EventScheduleItem> walimaSchedule = [
    EventScheduleItem(
      time: '07:30 PM',
      title: 'Grand Couple Entry & Reception',
      desc: 'Newlyweds $groomName & $brideName enter under lighted floral arches',
    ),
    EventScheduleItem(
      time: '08:30 PM',
      title: 'Gourmet Banquet Dinner',
      desc: 'Celebratory royal dinner with family, friends, and distinguished guests',
    ),
  ];

  static final List<GalleryPhoto> walimaGallery = [
    GalleryPhoto(
      title: 'Grand Couple Entry',
      asset: 'assets/images/walima_entry.jpg',
      caption: 'Groom & bride royal entry into the banquet ballroom',
    ),
    GalleryPhoto(
      title: 'Reception Banquet Dinner',
      asset: 'assets/images/walima_reception.jpg',
      caption:
          'Lavish ballroom dinner with crystal chandeliers & floral arches',
    ),
  ];

  // ---------------------------------------------------------------------------
  // 7. HELPER GENERATORS (Used by ApiService & App)
  // ---------------------------------------------------------------------------
  static WeddingDetails getWeddingDetails() {
    return WeddingDetails(
      id: 'ishaq-pimra-2026',
      groom: groomName,
      bride: brideName,
      dates: weddingDatesHeader,
      bismillahArabic: bismillahArabic,
      quranVerse: quranVerse,
      surahRef: surahReference,
      parentsBlessing: parentsBlessing,
    );
  }

  static List<WeddingEvent> getEvents() {
    return [
      WeddingEvent(
        id: 'mehndi',
        title: mehndiTitle,
        dayLabel: mehndiDayLabel,
        date: mehndiDate,
        themeColorHex: mehndiThemeColor,
        musicTitle: mehndiMusicTitle,
        description: mehndiDescription,
        dressCode: mehndiDressCode,
        venueName: mehndiVenueName,
        venueCity: mehndiVenueCity,
        mapUrl: mehndiMapUrl,
        schedule: mehndiSchedule,
        gallery: mehndiGallery,
      ),
      WeddingEvent(
        id: 'barat',
        title: baratTitle,
        dayLabel: baratDayLabel,
        date: baratDate,
        themeColorHex: baratThemeColor,
        musicTitle: baratMusicTitle,
        description: baratDescription,
        dressCode: baratDressCode,
        venueName: baratVenueName,
        venueCity: baratVenueCity,
        mapUrl: baratMapUrl,
        schedule: baratSchedule,
        gallery: baratGallery,
      ),
      WeddingEvent(
        id: 'walima',
        title: walimaTitle,
        dayLabel: walimaDayLabel,
        date: walimaDate,
        themeColorHex: walimaThemeColor,
        musicTitle: walimaMusicTitle,
        description: walimaDescription,
        dressCode: walimaDressCode,
        venueName: walimaVenueName,
        venueCity: walimaVenueCity,
        mapUrl: walimaMapUrl,
        schedule: walimaSchedule,
        gallery: walimaGallery,
      ),
    ];
  }
}
