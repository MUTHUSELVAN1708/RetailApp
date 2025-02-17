import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/screens/settings/header_and_footer.dart';
import 'package:retail_mobile/presentation/screens/settings/settings_other_screen.dart';

import 'package:retail_mobile/presentation/screens/store_details/add_store_details.dart';
import 'package:retail_mobile/presentation/widgets/common_list_of_items.dart';
import 'package:retail_mobile/presentation/widgets/custom_svg.dart';
import 'package:retail_mobile/state_management/state/floating_state.dart';

class SettingsMainScreen extends ConsumerStatefulWidget {
  const SettingsMainScreen({super.key});

  @override
  ConsumerState createState() => _SettingsMainScreenState();
}

class _SettingsMainScreenState extends ConsumerState<SettingsMainScreen> {
  final PageController _pageController = PageController();

  final List<Details> _settingsPages = [
    Details(
      'Store Details',
      'person',
      // AddStoreDetails(
      //   isEdit: true,
      // ),
        SettingsOtherScreen()
    ),
    Details('Header & Footer', 'header_footer', HeaderAndFooter()),
    Details('Other', 'other', SettingsOtherScreen()),
    Details('GST', 'gst', OwnerDetailsPage()),
    Details('Payment mode configuration', 'payment_mode', HeaderAndFooter()),
    Details('Machine', 'machine', PagesListPage()),
    Details('Print', 'printer', PagesListPage()),
    Details('Release Details', 'release', PagesListPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryButtonColor,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Settings',
          style: TextStyle(color: AppColors.primaryButtonColor),
        ),
        titleSpacing: -15,
      ),
      body: Column(
        children: [
          CommonListOfItems(
            detailsList: _settingsPages,
            pageController: _pageController,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                ref.read(boolProvider.notifier).pageIndex(index);
              },
              children: _settingsPages.map((page) => page.widget).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class OwnerDetailsPage extends StatelessWidget {
  const OwnerDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildLogoUpload(),
          _buildTextField('Firm Name'),
          _buildTextField('GSTIN'),
          _buildTextField('Phone Number'),
          _buildTextField('E-Mail'),
          _buildTextField('Address'),
          _buildTextField('City'),
          _buildTextField('POS'),
          _buildTextField('Device ID'),
          _buildTextField('Store Group Name'),
          _buildTextField('Store Name'),
          _buildTextField('Device Name'),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: const Size(double.infinity, 48),
            ),
            child: const Text(
              'Apply',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoUpload() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(Icons.image, size: 48, color: Colors.grey[400]),
          const SizedBox(height: 8),
          const Text('Company Logo'),
          TextButton(
            onPressed: () {},
            child: const Text('Browse files'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class PagesListPage extends StatelessWidget {
  const PagesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> pages = [
      'Change Log', 'Add Receipt', 'Cash In', 'Cash Out',
      'Day End Report', 'Master Double Pay', 'Report',
      // Add more pages as needed
    ];

    return ListView.builder(
      itemCount: pages.length + 1, // +1 for the Apply button
      itemBuilder: (context, index) {
        if (index == pages.length) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text(
                'Apply',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }

        return ListTile(
          leading: const Icon(Icons.circle, color: Colors.red, size: 12),
          title: Text(pages[index]),
          trailing: const Icon(Icons.check_box_outline_blank),
        );
      },
    );
  }
}
