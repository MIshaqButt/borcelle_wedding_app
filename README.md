# Royal Wedding Card & Mobile Invitation Suite 💍✨

**Muhammad Ishaq & Pimra Ahmad**  
20th – 22nd November 2026

A modern, animated wedding invitation application suite built with **Flutter** (Mobile / Multiplatform) and **Node.js Express** (Backend API).

---

## 📱 Repository Structure

```
├── wedding_app/       # Flutter Mobile Application
│   ├── lib/
│   │   ├── models/    # Wedding, Event, and RSVP data models
│   │   ├── screens/   # Home countdown, Mehndi, Barat, Walima, and RSVP screens
│   │   ├── services/  # API service with full offline fallback
│   │   ├── theme/     # Luxury theme palettes (Mehndi yellow, Barat crimson, Walima teal)
│   │   └── widgets/   # Interactive photo lightbox, audio player, animations
│   └── assets/        # Bespoke high-resolution imagery and celebratory audio tracks
└── backend/           # Node.js Express API Server
    ├── server.js      # REST API endpoints (/api/wedding, /api/events, /api/rsvp, /api/wishes)
    └── wedding_db.json# JSON database for RSVPs and guest wishes
```

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
