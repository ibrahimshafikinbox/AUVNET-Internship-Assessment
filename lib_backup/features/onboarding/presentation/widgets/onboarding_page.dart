import 'package:auvnet_flutter_internship/core/Helper/app_styles.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ],
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyles.onboardingTitle,
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: AppStyles.onboardingDescription,
          ),
        ),
      ],
    );
  }
}
