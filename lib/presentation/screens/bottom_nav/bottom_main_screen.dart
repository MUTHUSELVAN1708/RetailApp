import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/screens/billing/billing_screen.dart';
import 'package:retail_mobile/presentation/screens/cart/bill_screen.dart';
import 'package:retail_mobile/presentation/screens/cart/cart_screen.dart';
import 'package:retail_mobile/presentation/screens/cart/view_bill_screen.dart';
import 'package:retail_mobile/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:retail_mobile/presentation/screens/dashboard/sidebar_navigation.dart';
import 'package:retail_mobile/presentation/screens/shift/shift_main_screen.dart';
import 'package:retail_mobile/presentation/widgets/custom_svg.dart';
import 'package:retail_mobile/state_management/state/floating_state.dart';

class BottomMainScreen extends ConsumerStatefulWidget {
  const BottomMainScreen({super.key});

  @override
  ConsumerState<BottomMainScreen> createState() => _BottomMainScreenState();
}

class _BottomMainScreenState extends ConsumerState<BottomMainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = [
    const DashboardScreen(),
    const CartScreen(),
    const BillingScreen(),
    const ShiftMainScreen(),
    const ShiftMainScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(boolProvider).bottomIndex;
    return GestureDetector(
      onTap: () {
        if (ref.watch(boolProvider).isExpanded) {
          ref.read(boolProvider.notifier).toggleExpanded();
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        drawer: SidebarNavigation(),
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 150,
          leading: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: CustomSvg(
                  name: 'menu_icon',
                  width: 30,
                  height: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: CustomSvg(
                  name: 'notification',
                  width: 27,
                  height: 22,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Image.asset(
              'assets/images/elude_logo.png',
              height: 30,
            ),
          ],
        ),
        body: IndexedStack(
          index: index,
          children: _pages,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryButtonColor,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
              child: GNav(
                gap: 7,
                activeColor: AppColors.whiteColor,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                duration: Duration(milliseconds: 400),
                tabMargin: EdgeInsets.symmetric(vertical: 7),
                tabBackgroundColor: Color(0xFFC52341),
                color: AppColors.whiteColor,
                tabs: [
                  GButton(
                    icon: Icons.home_rounded,
                    text: 'HOME',
                  ),
                  GButton(
                    icon: Icons.shopping_cart_sharp,
                    text: 'CART',
                  ),
                  GButton(
                    icon: Icons.currency_rupee_outlined,
                    text: 'BILLING',
                  ),
                  GButton(
                    icon: Icons.access_time_filled_rounded,
                    text: 'SHIFT',
                  ),
                  GButton(
                    icon: Icons.receipt_long_rounded,
                    text: 'REPORTS',
                  ),
                ],
                selectedIndex: index,
                onTabChange: (index) {
                  if (ref.watch(boolProvider).isExpanded) {
                    ref.read(boolProvider.notifier).toggleExpanded();
                  }
                  ref.read(boolProvider.notifier).changeIndex(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
