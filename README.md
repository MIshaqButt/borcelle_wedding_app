# Royal Wedding Card & Mobile Invitation Suite 💍✨

**Muhammad Ishaq & Pimra Ahmad**  
20th – 22nd November 2026

A modern, animated wedding invitation application suite built with **Flutter** (Mobile / Multiplatform) and **Node.js Express** (Backend API).

---

## 📱 Repository Structure

```
├── wedding_app/       # Flutter Mobile Application
│   ├── lib/
│   │   ├── config/    # ⭐️ wedding_config.dart (CENTRAL EVENT DATA FILE: Bride, Groom, Dates, Times, Venues)
│   │   ├── models/    # Wedding, Event, and RSVP data models
│   │   ├── screens/   # Home countdown, Mehndi, Barat, Walima, and RSVP screens
│   │   ├── services/  # API service with full offline fallback
│   │   ├── theme/     # Luxury theme palettes (Mehndi yellow, Barat crimson, Walima teal)
│   │   └── widgets/   # Interactive photo lightbox, audio player, animations
│   └── assets/        # Bespoke high-resolution imagery and celebratory audio tracks
└── backend/           # Node.js Express API Server
    ├── server.js            # REST API endpoints (/api/wedding, /api/events, /api/rsvp, /api/wishes)
    ├── wedding_config.json  # ⭐️ Central backend event configuration (Groom, Bride, Dates, Venues, Timings)
    └── wedding_db.json      # JSON database for RSVPs and guest wishes
```

---

## ⚙️ How to Change Wedding Data (Names, Dates, Locations, Times)

You can easily change all event information in one single place:

### In the Flutter Mobile App:
Open **[`wedding_app/lib/config/wedding_config.dart`](file:///Users/apple/MY%20OWN/WeddingCard/wedding_app/lib/config/wedding_config.dart)**:
- **Bride & Groom Names**: Change `groomName` and `brideName`.
- **Countdown Target**: Change `countdownTarget = DateTime(YEAR, MONTH, DAY, HOUR, MINUTE)`.
- **Mehndi / Barat / Walima**:
  - `title`, `date`, `dayLabel`, `themeColor`, `musicTitle`, `description`, `dressCode`.
  - `venueName`, `venueCity`, `mapUrl` (Google Maps URL).
  - `schedule`: Times and descriptions (e.g. Arrival, Nikah, Lunch, Rukhsati, Reception Dinner).
  - `gallery`: Photos, titles, and captions.

### In the Backend:
Open **[`backend/wedding_config.json`](file:///Users/apple/MY%20OWN/WeddingCard/backend/wedding_config.json)**:
- Edit `wedding` object (groom, bride, dates, Quranic verses, RSVP contact).
- Edit `events` array (Mehndi, Barat, Walima details, venue, Google Maps coordinates/URLs, and schedules).
- Any edit takes effect immediately without needing to recompile!

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
