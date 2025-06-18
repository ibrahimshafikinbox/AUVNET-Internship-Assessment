import 'package:auvnet_flutter_internship/core/Helper/app_dimens.dart';
import 'package:flutter/material.dart';

class PromotionalBanner extends StatelessWidget {
  final String imagePath;

  const PromotionalBanner({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
