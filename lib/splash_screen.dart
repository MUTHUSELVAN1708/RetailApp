import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retail_mobile/presentation/screens/add_role/add_role_screen.dart';
import 'package:retail_mobile/presentation/screens/bottom_nav/bottom_main_screen.dart';
import 'package:retail_mobile/presentation/screens/cart/bill_screen.dart';
import 'package:retail_mobile/presentation/screens/cart/delete_bill.dart';
import 'package:retail_mobile/presentation/screens/cart/exchange_bill_generation.dart';
import 'package:retail_mobile/presentation/screens/cart/view_bill_screen.dart';
import 'package:retail_mobile/presentation/screens/configuration/configuration_main_screen.dart';
import 'package:retail_mobile/presentation/screens/customer_master/add_new_customer_screen.dart';
import 'package:retail_mobile/presentation/screens/customer_master/customer_master_main_screen.dart';
import 'package:retail_mobile/presentation/screens/customer_master/customer_passbook.dart';
import 'package:retail_mobile/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:retail_mobile/presentation/screens/day_end/day_end_screen.dart';
import 'package:retail_mobile/presentation/screens/download/download_main_screen.dart';
import 'package:retail_mobile/presentation/screens/item_master/add_new_item_screen.dart';
import 'package:retail_mobile/presentation/screens/item_master/item_master_main_screen.dart';
import 'package:retail_mobile/presentation/screens/payment_receipt/payment_receipt_screen.dart';
import 'package:retail_mobile/presentation/screens/price_stock/price_stock_screen.dart';
import 'package:retail_mobile/presentation/screens/price_stock/stocks_screen.dart';
import 'package:retail_mobile/presentation/screens/price_stock/update_price_stock.dart';
import 'package:retail_mobile/presentation/screens/purchase_order/purchase_order_screen.dart';
import 'package:retail_mobile/presentation/screens/settings/settings_main_screen.dart';
import 'package:retail_mobile/presentation/screens/shift/shift_end_screen.dart';
import 'package:retail_mobile/presentation/screens/shift/shift_start_screen.dart';
import 'package:retail_mobile/presentation/screens/supplier_details/supplier_details_screen.dart';
import 'package:retail_mobile/presentation/screens/supplier_item_linkage/link_items_screen.dart';
import 'package:retail_mobile/presentation/screens/supplier_item_linkage/supplier_item_linkage_screen.dart';
import 'package:retail_mobile/presentation/screens/user_management/add_user_screen.dart';
import 'package:retail_mobile/presentation/screens/user_management/user_list_screen.dart';
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
      await Future.delayed(Duration(seconds: 0));
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
        builder: (context) => PurchaseOrderScreen(),
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
