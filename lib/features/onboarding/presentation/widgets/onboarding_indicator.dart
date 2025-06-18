import 'package:auvnet_flutter_internship/core/Helper/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingIndicator extends StatelessWidget {
  final int itemCount;
  final int currentPage;

  const OnboardingIndicator({
    super.key,
    required this.itemCount,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index
                ? AppColors.primaryPurple
                : AppColors.primaryPurple.withOpacity(0.3),
          ),
        );
      }),
    );
  }
}
