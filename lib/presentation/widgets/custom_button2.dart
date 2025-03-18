import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';

class CustomButton2 extends StatelessWidget {
  final String text;
  final bool isColor;
  final VoidCallback onPressed;

  const CustomButton2({
    super.key,
    required this.text,
    required this.isColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: AppColors.primaryButtonColor),
        minimumSize: Size(MediaQuery.of(context).size.width / 2.3, 40),
        backgroundColor:
            isColor ? AppColors.primaryButtonColor : AppColors.whiteColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: isColor ? AppColors.whiteColor : AppColors.primaryButtonColor,
        ),
      ),
    );
  }
}
