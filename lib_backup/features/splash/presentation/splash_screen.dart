import 'package:auvnet_flutter_internship/core/Helper/asset_helper.dart';
import 'package:auvnet_flutter_internship/features/home/presentation/home_screen.dart';
import 'package:auvnet_flutter_internship/features/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.logo,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
