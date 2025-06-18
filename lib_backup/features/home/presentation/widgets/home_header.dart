import 'package:auvnet_flutter_internship/core/Helper/app_colors.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_dimens.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_styles.dart';
import 'package:auvnet_flutter_internship/core/Helper/asset_helper.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String userName;

  const HomeHeader({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryPurple,
                AppColors.accentYellow,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(AppDimens.borderRadius * 3),
              bottomRight: Radius.circular(AppDimens.borderRadius * 3),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimens.paddingLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivering to',
                          style: AppStyles.serviceTitleStyle.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: AppDimens.spaceSmall / 2),
                        const Text(
                          'Al Satwa, 81A Street',
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: AppDimens.spaceSmall),
                        Text(
                          userName,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: AppDimens.logoSize / 4,
                      backgroundImage: AssetImage(Assets.avatar),
                    ),
                  ],
                ),
                SizedBox(height: AppDimens.paddingLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
