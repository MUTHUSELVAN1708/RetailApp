import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav(
      {Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryButtonColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.currency_rupee), label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart), label: "Reports"),
      ],
    );
  }
}
