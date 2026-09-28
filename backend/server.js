const express = require('express');
const cors = require('cors');
const path = require('path');
const fs = require('fs');

const app = express();
const PORT = process.env.PORT || 5050;

app.use(cors());
app.use(express.json());

// Serve static assets (images, audio) directly from backend if needed
app.use('/media', express.static(path.join(__dirname, '../wedding_app/assets')));

// In-Memory Data Store (persisted to a local JSON file)
const DB_FILE = path.join(__dirname, 'wedding_db.json');
const CONFIG_FILE = path.join(__dirname, 'wedding_config.json');

function getWeddingConfig() {
    if (fs.existsSync(CONFIG_FILE)) {
        try {
            return JSON.parse(fs.readFileSync(CONFIG_FILE, 'utf8'));
        } catch (e) {
            console.error('Error reading wedding_config.json:', e);
        }
    }
    return null;
}

// Initialize DB file
function loadDb() {
    if (fs.existsSync(DB_FILE)) {
        try {
            return JSON.parse(fs.readFileSync(DB_FILE, 'utf8'));
        } catch (e) {
            console.error('Error reading DB, using default:', e);
        }
    }
    const defaultData = { wishes: [], rsvps: [] };
    fs.writeFileSync(DB_FILE, JSON.stringify(defaultData, null, 2), 'utf8');
    return defaultData;
}

function saveDb(data) {
    fs.writeFileSync(DB_FILE, JSON.stringify(data, null, 2), 'utf8');
}

let db = loadDb();

// ----------------- API ENDPOINTS -----------------

// Health check
app.get('/api/health', (req, res) => {
    res.json({ status: 'ok', service: 'Wedding Suite API', uptime: process.uptime() });
});

// Wedding Core Details
app.get('/api/wedding', (req, res) => {
    const config = getWeddingConfig();
    if (config && config.wedding) {
        return res.json(config.wedding);
    }
    res.status(500).json({ error: 'Wedding details not configured' });
});

// All 3 Events (Mehndi, Barat, Walima)
app.get('/api/events', (req, res) => {
    const config = getWeddingConfig();
    if (config && config.events) {
        return res.json(config.events);
    }
    res.status(500).json({ error: 'Events not configured' });
});

// Specific Event
app.get('/api/events/:id', (req, res) => {
    const config = getWeddingConfig();
    const events = (config && config.events) || [];
    const event = events.find(e => e.id.toLowerCase() === req.params.id.toLowerCase());
    if (!event) {
        return res.status(404).json({ error: 'Event not found' });
    }
    res.json(event);
});

// Get Wishes / Dua Wall
app.get('/api/wishes', (req, res) => {
    res.json(db.wishes);
});

// Post a New Wish
app.post('/api/wishes', (req, res) => {
    const { author, relation, message } = req.body;
    if (!author || !message) {
        return res.status(400).json({ error: 'Author and message are required' });
    }

    const newWish = {
        id: Date.now(),
        author: author.trim(),
        relation: relation ? relation.trim() : 'Well-wisher',
        message: message.trim(),
        timestamp: new Date().toISOString()
    };

    db.wishes.unshift(newWish);
    saveDb(db);
    res.status(201).json({ success: true, wish: newWish });
});

// Get RSVPs summary
app.get('/api/rsvp', (req, res) => {
    const totalGuests = db.rsvps.reduce((acc, r) => acc + (parseInt(r.guestCount) || 1), 0);
    res.json({
        totalResponses: db.rsvps.length,
        totalHeadcount: totalGuests,
        responses: db.rsvps
    });
});

// Submit RSVP
app.post('/api/rsvp', (req, res) => {
    const { name, email, phone, attendingMehndi, attendingBarat, attendingWalima, guestCount, notes } = req.body;
    if (!name) {
        return res.status(400).json({ error: 'Guest name is required' });
    }

    const newRsvp = {
        id: Date.now(),
        name: name.trim(),
        email: email ? email.trim() : '',
        phone: phone ? phone.trim() : '',
        attendingMehndi: Boolean(attendingMehndi),
        attendingBarat: Boolean(attendingBarat),
        attendingWalima: Boolean(attendingWalima),
        guestCount: parseInt(guestCount) || 1,
        notes: notes ? notes.trim() : '',
        submittedAt: new Date().toISOString()
    };

    db.rsvps.unshift(newRsvp);
    saveDb(db);
    res.status(201).json({ success: true, message: 'RSVP received with thanks!', rsvp: newRsvp });
});

app.listen(PORT, () => {
    console.log(`Wedding Backend API Server running on http://localhost:${PORT}`);
});
