import 'package:auvnet_flutter_internship/core/Helper/asset_helper.dart';
import 'package:flutter/material.dart';

import 'package:auvnet_flutter_internship/core/Helper/app_colors.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_dimens.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_styles.dart';

class ShortcutItem extends StatelessWidget {
  final String label;
  final String imagPath;

  const ShortcutItem({
    Key? key,
    required this.label,
    required this.imagPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.bink,
            ),
            child: Image.asset(imagPath),
          ),
        ),
        Text(label, style: AppStyles.serviceTitleStyle.copyWith(fontSize: 14)),
      ],
    );
  }
}

class ShortcutList extends StatelessWidget {
  const ShortcutList({super.key});

  @override
  Widget build(BuildContext context) {
    final shortcutItems = [
      {'label': 'Past orders', 'imagePath': Assets.pastOrder},
      {'label': 'Super Saver', 'imagePath': Assets.superSaver},
      {'label': 'Must-tries', 'imagePath': Assets.mustTries},
      {'label': 'Give Back', 'imagePath': Assets.giveBack},
      {'label': 'Best Sellers', 'imagePath': Assets.bestSellrt},
    ];

    return SizedBox(
      height: 140, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: shortcutItems.length,
        itemBuilder: (context, index) {
          final item = shortcutItems[index];
          return ShortcutItem(
            label: item['label'] ?? "",
            imagPath: item['imagePath'] ?? '',
          );
        },
      ),
    );
  }
}
