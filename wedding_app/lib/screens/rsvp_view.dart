import 'package:flutter/material.dart';
import '../models/wedding_model.dart';
import '../services/api_service.dart';
import '../theme/app_theme.dart';

class RsvpView extends StatefulWidget {
  const RsvpView({super.key});

  @override
  State<RsvpView> createState() => _RsvpViewState();
}

class _RsvpViewState extends State<RsvpView> {
  // RSVP Form controllers
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _notesController = TextEditingController();
  bool _attendingMehndi = true;
  bool _attendingBarat = true;
  bool _attendingWalima = true;
  int _guestCount = 2;
  bool _isSubmittingRsvp = false;

  // Wishes Form controllers
  final _wisherNameController = TextEditingController();
  final _wisherRelationController = TextEditingController();
  final _wisherMsgController = TextEditingController();
  bool _isSubmittingWish = false;

  List<GuestWish> _wishes = [];
  bool _isLoadingWishes = true;

  @override
  void initState() {
    super.initState();
    _loadWishes();
  }

  Future<void> _loadWishes() async {
    final list = await ApiService.fetchWishes();
    if (mounted) {
      setState(() {
        _wishes = list;
        _isLoadingWishes = false;
      });
    }
  }

  Future<void> _handleRsvpSubmit() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name.')),
      );
      return;
    }

    setState(() => _isSubmittingRsvp = true);

    final success = await ApiService.submitRsvp(
      name: name,
      phone: _phoneController.text.trim(),
      attendingMehndi: _attendingMehndi,
      attendingBarat: _attendingBarat,
      attendingWalima: _attendingWalima,
      guestCount: _guestCount,
      notes: _notesController.text.trim(),
    );

    if (mounted) {
      setState(() => _isSubmittingRsvp = false);
      if (success) {
        _nameController.clear();
        _phoneController.clear();
        _notesController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color(0xFF10B981),
            content: Text('✨ JazakAllah! Your RSVP has been confirmed.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color(0xFF10B981),
            content: Text('✨ RSVP saved locally with thanks!'),
          ),
        );
      }
    }
  }

  Future<void> _handleWishSubmit() async {
    final name = _wisherNameController.text.trim();
    final msg = _wisherMsgController.text.trim();
    if (name.isEmpty || msg.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out your name and Dua message.')),
      );
      return;
    }

    setState(() => _isSubmittingWish = true);

    await ApiService.postWish(
      name,
      _wisherRelationController.text.trim().isEmpty ? 'Family Friend' : _wisherRelationController.text.trim(),
      msg,
    );

    final newWish = GuestWish(
      id: DateTime.now().millisecondsSinceEpoch,
      author: name,
      relation: _wisherRelationController.text.trim().isEmpty ? 'Family Friend' : _wisherRelationController.text.trim(),
      message: msg,
      timestamp: DateTime.now().toIso8601String(),
    );

    if (mounted) {
      setState(() {
        _isSubmittingWish = false;
        _wishes.insert(0, newWish);
      });
      _wisherNameController.clear();
      _wisherRelationController.clear();
      _wisherMsgController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppTheme.gold,
          content: Text('💖 Your blessings have been sent to the couple!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.darkBg,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.gold.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.gold),
                ),
                child: const Text(
                  'CONFIRM ATTENDANCE & SEND DUAS',
                  style: TextStyle(
                    color: AppTheme.goldBright,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Digital RSVP & Wishes Wall',
              textAlign: TextAlign.center,
              style: AppTheme.headingStyle(fontSize: 26, color: AppTheme.goldLight),
            ),
            const SizedBox(height: 24),

            // RSVP FORM CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.cardDark,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.gold.withOpacity(0.4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'ATTENDANCE CONFIRMATION',
                    style: TextStyle(
                      color: AppTheme.goldLight,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildTextField(controller: _nameController, label: 'Your Full Name / Family Name', icon: Icons.person_outline),
                  const SizedBox(height: 12),
                  _buildTextField(controller: _phoneController, label: 'Phone / WhatsApp Number', icon: Icons.phone_outlined, keyboardType: TextInputType.phone),
                  const SizedBox(height: 16),

                  const Text(
                    'Which events will you attend?',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                  const SizedBox(height: 8),

                  _buildCheckbox(
                    title: 'Mehndi (Friday, 20 Nov)',
                    value: _attendingMehndi,
                    activeColor: AppTheme.mehndiYellow,
                    onChanged: (val) => setState(() => _attendingMehndi = val ?? true),
                  ),
                  _buildCheckbox(
                    title: 'Barat (Saturday, 21 Nov)',
                    value: _attendingBarat,
                    activeColor: AppTheme.baratCrimson,
                    onChanged: (val) => setState(() => _attendingBarat = val ?? true),
                  ),
                  _buildCheckbox(
                    title: 'Walima (Sunday, 22 Nov)',
                    value: _attendingWalima,
                    activeColor: AppTheme.walimaGold,
                    onChanged: (val) => setState(() => _attendingWalima = val ?? true),
                  ),
                  const SizedBox(height: 14),

                  // Guest count row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Guests Attending:',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppTheme.gold.withOpacity(0.3)),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, color: AppTheme.goldBright, size: 18),
                              onPressed: () {
                                if (_guestCount > 1) setState(() => _guestCount--);
                              },
                            ),
                            Text(
                              '$_guestCount',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, color: AppTheme.goldBright, size: 18),
                              onPressed: () {
                                if (_guestCount < 10) setState(() => _guestCount++);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  _buildTextField(controller: _notesController, label: 'Special notes or dietary preference', icon: Icons.notes_outlined, maxLines: 2),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.gold,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _isSubmittingRsvp ? null : _handleRsvpSubmit,
                    child: _isSubmittingRsvp
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                        : const Text('Confirm RSVP', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // BLESSINGS & DUA WALL FORM
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.cardDark,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.gold.withOpacity(0.4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'SEND YOUR HEARTFELT DUAS',
                    style: TextStyle(
                      color: AppTheme.goldLight,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 14),

                  _buildTextField(controller: _wisherNameController, label: 'Your Name', icon: Icons.person_outline),
                  const SizedBox(height: 10),
                  _buildTextField(controller: _wisherRelationController, label: 'Relation (e.g. Uncle, Cousin, Friend)', icon: Icons.family_restroom_outlined),
                  const SizedBox(height: 10),
                  _buildTextField(controller: _wisherMsgController, label: 'Write your Dua & congratulations...', icon: Icons.favorite_outline, maxLines: 3),
                  const SizedBox(height: 18),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.baratCrimson,
                      foregroundColor: AppTheme.goldLight,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _isSubmittingWish ? null : _handleWishSubmit,
                    child: _isSubmittingWish
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                        : const Text('✨ Post Dua & Blessings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // LIVE WISHES STREAM
            const Text(
              'LIVE BLESSINGS STREAM',
              style: TextStyle(
                color: AppTheme.goldLight,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 12),

            if (_isLoadingWishes)
              const Center(child: CircularProgressIndicator(color: AppTheme.gold))
            else
              ..._wishes.map((w) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.cardDark,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppTheme.gold.withOpacity(0.2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '"${w.message}"',
                        style: const TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '— ${w.author} (${w.relation})',
                            style: const TextStyle(
                              color: AppTheme.goldBright,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          const Text(
                            '❤️ Blessings',
                            style: TextStyle(color: Colors.white38, fontSize: 11),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54, fontSize: 13),
        prefixIcon: Icon(icon, color: AppTheme.gold, size: 20),
        filled: true,
        fillColor: Colors.black26,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppTheme.gold.withOpacity(0.25)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppTheme.gold),
        ),
      ),
    );
  }

  Widget _buildCheckbox({
    required String title,
    required bool value,
    required Color activeColor,
    required Function(bool?) onChanged,
  }) {
    return CheckboxListTile(
      title: Text(title, style: const TextStyle(color: Colors.white70, fontSize: 13)),
      value: value,
      activeColor: activeColor,
      checkColor: Colors.black,
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: onChanged,
    );
  }
}
