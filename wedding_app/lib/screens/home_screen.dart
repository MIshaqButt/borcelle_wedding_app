import 'dart:async';

import 'package:flutter/material.dart';

import '../models/wedding_model.dart';
import '../services/api_service.dart';
import '../theme/app_theme.dart';
import '../config/wedding_config.dart';
import 'mehndi_view.dart';
import 'barat_view.dart';
import 'walima_view.dart';
import 'rsvp_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTabIndex = 1; // Default to Barat (Main Event)
  List<WeddingEvent> _events = [];
  bool _isLoading = true;

  // Countdown timer state
  late Timer _countdownTimer;
  Duration _timeUntilBarat = Duration.zero;

  @override
  void initState() {
    super.initState();
    _loadData();
    _initCountdown();
  }

  void _initCountdown() {
    final targetDate = WeddingConfig.countdownTarget;
    _updateTime(targetDate);
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime(targetDate);
    });
  }

  void _updateTime(DateTime target) {
    final now = DateTime.now();
    final diff = target.difference(now);
    if (mounted) {
      setState(() {
        _timeUntilBarat = diff.isNegative ? Duration.zero : diff;
      });
    }
  }

  @override
  void dispose() {
    _countdownTimer.cancel();
    super.dispose();
  }

  Future<void> _loadData() async {
    final events = await ApiService.fetchEvents();
    if (mounted) {
      setState(() {
        _events = events;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: AppTheme.darkBg,
        body: Center(child: CircularProgressIndicator(color: AppTheme.gold)),
      );
    }

    final mehndiEvent = _events.firstWhere(
      (e) => e.id == 'mehndi',
      orElse: () => _events[0],
    );
    final baratEvent = _events.firstWhere(
      (e) => e.id == 'barat',
      orElse: () => _events[0],
    );
    final walimaEvent = _events.firstWhere(
      (e) => e.id == 'walima',
      orElse: () => _events[0],
    );

    return Scaffold(
      backgroundColor: AppTheme.darkBg,
      appBar: AppBar(
        backgroundColor: AppTheme.cardDark.withValues(alpha: 0.95),
        elevation: 4,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/seal.jpg', width: 28, height: 28),
            const SizedBox(width: 8),
            Text(
              'Muhammad Ishaq & Pimra Ahmad',
              style: AppTheme.headingStyle(
                fontSize: 15,
                color: AppTheme.goldLight,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Collapsible Top Hero & Countdown
          _buildHeroHeader(),

          // Navigation Event Tabs
          _buildEventTabs(),

          // Active Event View
          Expanded(
            child: IndexedStack(
              index: _selectedTabIndex,
              children: [
                MehndiView(event: mehndiEvent),
                BaratView(event: baratEvent),
                WalimaView(event: walimaEvent),
                const RsvpView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroHeader() {
    final days = _timeUntilBarat.inDays;
    final hours = _timeUntilBarat.inHours % 24;
    final minutes = _timeUntilBarat.inMinutes % 60;
    final seconds = _timeUntilBarat.inSeconds % 60;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        border: Border(
          bottom: BorderSide(color: AppTheme.gold.withValues(alpha: 0.3)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                style: TextStyle(
                  color: AppTheme.goldLight,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'COUNTDOWN TO BARAT (21 NOV 2026)',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.gold.withValues(alpha: 0.4)),
            ),
            child: Text(
              '${days}d : ${hours}h : ${minutes}m : ${seconds}s',
              style: const TextStyle(
                color: AppTheme.goldBright,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventTabs() {
    return Container(
      color: Colors.black.withValues(alpha: 0.6),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          _buildTabItem(0, '🌿 Mehndi', '20 Nov', AppTheme.mehndiYellow),
          _buildTabItem(1, '👑 Barat', '21 Nov', AppTheme.baratCrimson),
          _buildTabItem(2, '🕊️ Walima', '22 Nov', AppTheme.walimaGold),
          _buildTabItem(3, '💌 RSVP', 'Duas', Colors.tealAccent),
        ],
      ),
    );
  }

  Widget _buildTabItem(
    int index,
    String title,
    String subtitle,
    Color activeAccent,
  ) {
    final isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTabIndex = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? activeAccent.withValues(alpha: 0.25)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? activeAccent : Colors.white12,
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white60,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  color: isSelected ? activeAccent : Colors.white38,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
