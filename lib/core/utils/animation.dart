import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

class AppAnimation {
  late AnimationController controller;
  late Animation<Offset> animation;

  AppAnimation({required TickerProvider vsync}) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );

    animation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));
  }

  void dispose() {
    controller.dispose();
  }
}
