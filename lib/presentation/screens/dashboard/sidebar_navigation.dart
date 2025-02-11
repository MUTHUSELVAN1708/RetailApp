import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/common_image_widget.dart';

class SidebarNavigation extends StatelessWidget {
  const SidebarNavigation({super.key});

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
              _buildMenuItem('Dashboard', Icons.dashboard, () {}),
              _buildMenuItem('Billing', Icons.receipt, () {}),
              _buildMenuItem('Shifts', Icons.inventory, () {}),
            ]),
            _buildSection('Masters', [
              _buildMenuItem('Item Master', Icons.list_alt, () {}),
              _buildMenuItem('Customer Master', Icons.people, () {}),
              _buildMenuItem('User Management', Icons.manage_accounts, () {}),
              _buildMenuItem('Add Role', Icons.admin_panel_settings, () {}),
              _buildMenuItem('Price / Stock', Icons.price_change, () {}),
              _buildMenuItem('Configuration', Icons.settings_outlined, () {}),
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
              _buildMenuItem('Settings', Icons.settings, () {}),
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
      onTap: () => onTap(),
    );
  }
}
