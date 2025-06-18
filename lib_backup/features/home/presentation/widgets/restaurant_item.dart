import 'package:auvnet_flutter_internship/core/Helper/app_colors.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_dimens.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_styles.dart';
import 'package:flutter/material.dart';

class RestaurantItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String time;

  const RestaurantItem({
    super.key,
    required this.imagePath,
    required this.name,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: AppDimens.spaceSmall),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 217, 213, 213))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppDimens.borderRadius)),
                child: Image.asset(imagePath,
                    cacheHeight: 50,
                    height: AppDimens.restaurantImageSize,
                    width: double.infinity,
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppDimens.paddingSmall),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(name,
                    style: AppStyles.restaurantNameStyle,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: AppDimens.spaceSmall / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.timer_outlined,
                        size: 14, color: AppColors.textGrey),
                    const SizedBox(width: 4),
                    Text(time, style: AppStyles.restaurantTimeStyle),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
