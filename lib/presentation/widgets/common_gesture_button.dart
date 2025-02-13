import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';

class CommonGestureButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color color;

  const CommonGestureButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 9),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
