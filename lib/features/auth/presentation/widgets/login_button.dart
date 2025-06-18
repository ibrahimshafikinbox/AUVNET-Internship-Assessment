import 'package:auvnet_flutter_internship/core/Helper/app_colors.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_dimens.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text; 

  final bool isLoading; 

  const PrimaryButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppDimens.buttonHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed, 
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                text, 
                style: AppStyles.buttonTextStyle,
              ),
      ),
    );
  }
}
