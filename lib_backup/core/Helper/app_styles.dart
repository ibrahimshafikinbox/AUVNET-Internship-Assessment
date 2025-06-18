import 'package:auvnet_flutter_internship/core/Helper/app_colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle onboardingTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textBlack,
  );

  static const TextStyle onboardingDescription = TextStyle(
    fontSize: 16,
    color: AppColors.textGrey,
    height: 1.5,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle nextButtonTextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.textGrey,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle createAccountTextStyle = TextStyle(
    color: Color(0xFF1877F2),
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  
  static const TextStyle appWhiteStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  
  static const TextStyle serviceTitleStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  
  static const TextStyle discountTextStyle = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryPurple,
  );

  
  static const TextStyle restaurantNameStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  
  static const TextStyle restaurantTimeStyle = TextStyle(
    fontSize: 12.0,
    color: AppColors.textGrey,
  );
}
