import 'package:auvnet_flutter_internship/core/Helper/app_colors.dart';
import 'package:auvnet_flutter_internship/core/Helper/asset_helper.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/login_screen.dart';
import 'package:auvnet_flutter_internship/features/home/presentation/home_screen.dart';
import 'package:auvnet_flutter_internship/features/onboarding/domain/onboarding_item.dart';
import 'package:auvnet_flutter_internship/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:auvnet_flutter_internship/features/onboarding/presentation/widgets/onboarding_indicator.dart';
import 'package:auvnet_flutter_internship/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      imagePath: Assets.merged_logo,
      title: 'all-in-one delivery',
      description:
          'Order groceries, medicines, and meals delivered straight to your door',
    ),
    OnboardingItem(
      imagePath: Assets.merged_logo,
      title: 'User-to-User Delivery',
      description: 'Send or receive items from other users quickly and easily',
    ),
    OnboardingItem(
      imagePath: Assets.merged_logo,
      title: 'Sales & Discounts',
      description: 'Discover exclusive sales and deals every day',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentPage < _onboardingItems.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      _onGetStartedPressed();
    }
  }

  void _onGetStartedPressed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onboardingItems.length,
              itemBuilder: (context, index) {
                final item = _onboardingItems[index];
                return OnboardingPage(
                  imagePath: item.imagePath,
                  title: item.title,
                  description: item.description,
                );
              },
            ),
          ),
          Column(
            children: [
              OnboardingIndicator(
                itemCount: _onboardingItems.length,
                currentPage: _currentPage,
              ),
              const SizedBox(height: 30),
              OnboardingButton(
                text: _currentPage == _onboardingItems.length - 1
                    ? 'Get Started'
                    : 'Next',
                onPressed: _currentPage == _onboardingItems.length - 1
                    ? _onGetStartedPressed
                    : _onNextPressed,
                isLastPage: _currentPage == _onboardingItems.length - 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
