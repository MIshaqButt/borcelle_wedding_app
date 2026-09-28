# Royal Wedding Card & Mobile Invitation Suite 💍✨

**Muhammad Ishaq & Pimra Ahmad**  
20th – 22nd November 2026

A modern, animated wedding invitation application suite built with **Flutter** (Mobile / Multiplatform) and **Node.js Express** (Backend API).

---

## 📱 Repository Structure

```
└── wedding_app/       # Complete Standalone Flutter Mobile App (Android APK & iOS)
    ├── lib/
    │   ├── config/    # ⭐️ wedding_config.dart (THE ONLY DATA FILE: Bride, Groom, WhatsApp #, Dates, Times, Venues)
    │   ├── models/    # Wedding, Event, and RSVP data models
    │   ├── screens/   # Home countdown, Mehndi, Barat, Walima, and RSVP/Dua screens
    │   ├── services/  # Local instant data service
    │   ├── theme/     # Luxury theme palettes (Mehndi amber, Barat crimson, Walima teal)
    │   └── widgets/   # Interactive photo lightbox, audio player, animations
    └── assets/        # Bespoke high-resolution imagery and celebratory audio tracks
```

---

## ⚙️ The Single File to Change Everything

You only need to edit **one single file**:  
👉 **[`wedding_app/lib/config/wedding_config.dart`](file:///Users/apple/MY%20OWN/WeddingCard/wedding_app/lib/config/wedding_config.dart)**

Inside this file, you can modify:
1. **WhatsApp Number**: `whatsappNumber` (e.g. `'923001234567'`). All Duas and RSVP confirmations from guests are formatted and delivered directly into your WhatsApp!
2. **Bride & Groom Names**: `groomName` and `brideName`.
3. **Countdown Clock**: `countdownTarget = DateTime(YEAR, MONTH, DAY, HOUR, MINUTE)`.
4. **Mehndi Event**: Date, timings, venue, dress code, schedule, music, photos.
5. **Barat Event**: Date, timings (Arrival, Nikah, Lunch, Rukhsati), Koh-e-Noor venue, Google Maps link, photos.
6. **Walima Event**: Date, reception & dinner timings, venue, Google Maps link, photos.

---

## 📲 Building the Android APK
```bash
cd wedding_app
flutter build apk --release
# Output APK location: wedding_app/build/app/outputs/flutter-apk/app-release.apk
```
Send `app-release.apk` directly to family and friends over WhatsApp or Drive!

---

## 🌟 Key Highlights & Features

### 1. Mehndi Celebration (20 Nov 2026)
- Radiant mustard-gold and emerald aesthetics.
- Interactive dhol drum beats and Punjabi dance celebrations.
- Traditional festive soundtrack.

### 2. Barat & Nikah Ceremony (21 Nov 2026)
- Royal crimson and Mughal gold luxury styling.
- High-resolution imagery: Nikah ceremony, Barat floral welcome, emotional Rukhsati, and Bhangra celebrations.
- Complete timeline: 1:00 PM Arrival, 2:00 PM Lunch, 4:00 PM Rukhsati.
- Interactive venue navigation directly linking to **Koh-e-Noor Marquee, Farooqabad**.

### 3. Walima Reception (22 Nov 2026)
- Regal midnight blue, deep teal, and champagne gold.
- Couple grand entry and elegant banquet reception imagery.
- Evening banquet itinerary and dinner schedule.

### 4. Interactive RSVP & Live Duas
- Guests can submit RSVP responses (attending headcount, contact details).
- Real-time guestbook & Dua feed with blessings for the couple.

---

## 🚀 Getting Started

### 1. Backend Server
```bash
cd backend
npm install
npm start
# Server runs on http://localhost:5050
```

### 2. Flutter Mobile App
```bash
cd wedding_app
flutter pub get
flutter run
```
To run on a specific platform:
- **Android:** `flutter run -d android`
- **iOS:** `flutter run -d ios`
- **Web preview:** `flutter run -d chrome`

---

## 🛠️ Tech Stack
- **Mobile Frontend:** Flutter 3.x, Google Fonts (Cinzel, Playfair Display, Montserrat), `url_launcher`, `intl`, `http`.
- **Backend:** Node.js, Express, CORS.
