import 'package:auvnet_flutter_internship/core/Helper/app_colors.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_styles.dart';
import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLastPage;

  const OnboardingButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLastPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
              child: Text(
                isLastPage ? 'Get Started' : 'Get Started',
                style: AppStyles.buttonTextStyle,
              ),
            ),
          ),
          if (!isLastPage)
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextButton(
                onPressed: onPressed,
                child: const Text(
                  'next',
                  style: AppStyles.nextButtonTextStyle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
