import 'package:auvnet_flutter_internship/core/Helper/app_colors.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_dimens.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ServiceItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;

  const ServiceItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppDimens.paddingSmall),
          decoration: BoxDecoration(
            color: AppColors.lightGrey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(AppDimens.borderRadius),
          ),
          child: Image.asset(iconPath,
              width: AppDimens.serviceIconSize,
              height: AppDimens.serviceIconSize),
        ),
        const SizedBox(height: AppDimens.spaceSmall),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.primaryPurple,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(subtitle, style: AppStyles.appWhiteStyle),
            )),
        Text(title, style: AppStyles.serviceTitleStyle),
      ],
    );
  }
}
