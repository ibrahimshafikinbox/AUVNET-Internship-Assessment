import 'package:auvnet_flutter_internship/core/Helper/app_colors.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_dimens.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_styles.dart';
import 'package:flutter/material.dart';

class CodeBanner extends StatelessWidget {
  final String iconPath;
  final String title;
  final String description;

  const CodeBanner({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            iconPath,
          ),
          const SizedBox(width: AppDimens.spaceMedium),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.serviceTitleStyle
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                description,
                style: AppStyles.restaurantTimeStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
