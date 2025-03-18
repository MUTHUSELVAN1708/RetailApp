import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/core/utils/nav_helper.dart';
import 'package:retail_mobile/presentation/screens/add_role/add_role_screen.dart';
import 'package:retail_mobile/presentation/screens/configuration/configuration_main_screen.dart';
import 'package:retail_mobile/presentation/screens/price_stock/price_stock_screen.dart';
import 'package:retail_mobile/presentation/screens/settings/settings_main_screen.dart';
import 'package:retail_mobile/state_management/state/floating_state.dart';

class SidebarNavigation extends ConsumerStatefulWidget {
  const SidebarNavigation({super.key});

  @override
  ConsumerState<SidebarNavigation> createState() => _SidebarNavigationState();
}

class _SidebarNavigationState extends ConsumerState<SidebarNavigation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  color: AppColors.primaryButtonColor,
                  image: DecorationImage(
                    image: AssetImage('assets/images/side_bar.png'),
                    fit: BoxFit.cover,
                  )),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.close,
                        color: AppColors.whiteColor,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person,
                            size: 35, color: Color(0xFFD32F2F)),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Tommy',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        'Admin',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildSection('Sales', [
              _buildMenuItem('Dashboard', Icons.dashboard, () {
                ref.read(boolProvider.notifier).changeIndex(0);
              }),
              _buildMenuItem('Billing', Icons.receipt, () {
                ref.read(boolProvider.notifier).changeIndex(2);
              }),
              _buildMenuItem('Shifts', Icons.inventory, () {
                ref.read(boolProvider.notifier).changeIndex(3);
              }),
            ]),
            _buildSection('Masters', [
              _buildMenuItem('Item Master', Icons.list_alt, () {}),
              _buildMenuItem('Customer Master', Icons.people, () {}),
              _buildMenuItem('User Management', Icons.manage_accounts, () {}),
              _buildMenuItem('Add Role', Icons.admin_panel_settings, () {
                NavigationHelper.slideNavigateTo(
                    context: context, screen: RoleManagementScreen());
              }),
              _buildMenuItem('Price / Stock', Icons.price_change, () {
                NavigationHelper.slideNavigateTo(
                    context: context, screen: PriceStockScreen());
              }),
              _buildMenuItem('Configuration', Icons.settings_outlined, () {
                NavigationHelper.slideNavigateTo(
                    context: context, screen: ConfigurationMainScreen());
              }),
              _buildMenuItem('Payment / Receipt', Icons.payment, () {}),
              _buildMenuItem('Day End', Icons.access_time, () {}),
              _buildMenuItem('Download', Icons.download, () {}),
            ]),
            _buildSection('Inward Management', [
              _buildMenuItem('Supplier Details', Icons.business, () {}),
              _buildMenuItem('Supplier Item Linkage', Icons.link, () {}),
              _buildMenuItem('Purchase Order', Icons.shopping_cart, () {}),
              _buildMenuItem('Sales Order', Icons.point_of_sale, () {}),
              _buildMenuItem('Goods Inward Note', Icons.input, () {}),
              _buildMenuItem('View PO & GIN', Icons.visibility, () {}),
              _buildMenuItem('Supplier Payment', Icons.payment, () {}),
            ]),
            _buildSection('Credit / Debit Note', [
              _buildMenuItem('Credit / Debit Note', Icons.note, () {}),
            ]),
            _buildSection('Reports', [
              _buildMenuItem('Reports', Icons.analytics, () {}),
            ]),
            _buildSection('Customer Support', [
              _buildMenuItem('Customer Support', Icons.support_agent, () {}),
            ]),
            _buildSection('Settings', [
              _buildMenuItem('Settings', Icons.settings, () {
                NavigationHelper.slideNavigateTo(
                    context: context, screen: SettingsMainScreen());
              }),
              _buildMenuItem('Log Out', Icons.logout, () {}),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...items,
      ],
    );
  }

  Widget _buildMenuItem(String title, IconData icon, void Function() onTap) {
    return ListTile(
        leading: Icon(icon, color: AppColors.primaryButtonColor, size: 20),
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.blackColor,
            fontSize: 15,
          ),
        ),
        dense: true,
        onTap: () {
          Navigator.of(context).pop();
          onTap();
        });
  }
}
