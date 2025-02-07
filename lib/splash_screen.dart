import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retail_mobile/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      // final token = await _getToken();

      // if (token != null && token.isNotEmpty) {
      await Future.delayed(Duration(seconds: 2));
      _navigateToMainScreen();
      // } else {
      //   _navigateToInitialScreen();
      // }
    } catch (e) {}
  }

  void _navigateToMainScreen() {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const DashboardScreen(),
      ),
    );
  }

  // void _navigateToInitialScreen() {
  //   if (!mounted) return;
  //   Navigator.pushAndRemoveUntil(
  //     context,
  //     MaterialPageRoute(builder: (context) => const InitialScreen()),
  //         (route) => false,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Icon(FontAwesomeIcons.store),
        // child: Image(
        //   image: AssetImage('assets/image/astro_logo.png'),
        //   fit: BoxFit.contain,
        // ),
      ),
    );
  }

// static Future<String?> _getToken() async {
//   final prefs = await SharedPreferences.getInstance();
//   print('token Id');
//   print(prefs.getString('token'));
//   return prefs.getString('token');
// }
}
