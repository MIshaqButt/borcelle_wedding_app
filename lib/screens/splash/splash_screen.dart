

import 'package:borcelle_wedding_app/gen/assets.gen.dart';
import 'package:borcelle_wedding_app/gen/colors.gen.dart';
import 'package:borcelle_wedding_app/screens/dashboard/view/dashboard_screen.dart';
import 'package:borcelle_wedding_app/screens/onboarding/view/on_boarding_screen.dart';
import 'package:borcelle_wedding_app/utils/my_prefs.dart';
import 'package:borcelle_wedding_app/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      _navigateNext();
    });
  }

  void _navigateNext() async {
    bool isLoggedIn = MyPrefs.getCurrentUserToken()?.isNotEmpty ?? false;

    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder:
              (_) => isLoggedIn ? const DashboardScreen() : const OnBoardingScreen(),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height,
        width: context.width,
        color: ColorName.white,
        child: Assets.images.logo.image(
          width: context.width * 0.5,
          height: context.height * 0.5,
        ),
      ),
    );
  }
}
