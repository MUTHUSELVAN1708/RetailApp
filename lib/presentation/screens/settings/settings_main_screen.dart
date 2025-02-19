import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/screens/settings/header_and_footer.dart';
import 'package:retail_mobile/presentation/screens/settings/settings_gst_screen.dart';
import 'package:retail_mobile/presentation/screens/settings/settings_machine_screen.dart';
import 'package:retail_mobile/presentation/screens/settings/settings_other_screen.dart';
import 'package:retail_mobile/presentation/screens/settings/settings_payment_mode_configuration.dart';
import 'package:retail_mobile/presentation/screens/settings/settings_print_screen.dart';
import 'package:retail_mobile/presentation/screens/settings/settings_release_notes_screen.dart';
import 'package:retail_mobile/presentation/screens/store_details/add_store_details.dart';
import 'package:retail_mobile/presentation/widgets/common_list_of_items.dart';
import 'package:retail_mobile/state_management/state/floating_state.dart';

class SettingsMainScreen extends ConsumerStatefulWidget {
  const SettingsMainScreen({super.key});

  @override
  ConsumerState createState() => _SettingsMainScreenState();
}

class _SettingsMainScreenState extends ConsumerState<SettingsMainScreen> {
  final PageController _pageController = PageController();

  final List<ReleaseInfo> _releases = [
    ReleaseInfo(
      version: '[V2.4.2PS]',
      releaseDate: '10-09-2022',
      description: [
        'If you forgot your login password or want to change it, follow these steps:',
        'Access the Forgot Password link.',
        'Enter your mobile number or email ID associated with your account.',
        'You will receive a SMS & email ID with a link to reset your password.',
        'Follow the link to reset your password securely.',
      ],
    ),
    ReleaseInfo(
      version: '[V2.4.2PS]',
      releaseDate: '10-09-2022',
      description: [
        'If you forgot your login password or want to change it, follow these steps:',
        'Access the Forgot Password link.',
        'Enter your mobile number or email ID associated with your account.',
        'You will receive a SMS & email ID with a link to reset your password.',
        'Follow the link to reset your password securely.',
      ],
    ),
    ReleaseInfo(
      version: '[V2.4.2PS]',
      releaseDate: '10-09-2022',
      description: [
        'If you forgot your login password or want to change it, follow these steps:',
        'Access the Forgot Password link.',
        'Enter your mobile number or email ID associated with your account.',
        'You will receive a SMS & email ID with a link to reset your password.',
        'Follow the link to reset your password securely.',
      ],
    ),
    ReleaseInfo(
      version: '[V2.4.2PS]',
      releaseDate: '10-09-2022',
      description: [
        'If you forgot your login password or want to change it, follow these steps:',
        'Access the Forgot Password link.',
        'Enter your mobile number or email ID associated with your account.',
        'You will receive a SMS & email ID with a link to reset your password.',
        'Follow the link to reset your password securely.',
      ],
    ),
  ];

  final List<Details> _settingsPages = [];

  @override
  void initState() {
    super.initState();
    _settingsPages.addAll([
      Details(
          'Store Details',
          'person',
          AddStoreDetails(
            isEdit: true,
          )),
      Details('Header & Footer', 'header_footer', HeaderAndFooter()),
      Details('Other', 'other', SettingsOtherScreen()),
      Details('GST', 'gst', SettingsGstScreen()),
      Details('Payment mode configuration', 'payment_mode',
          SettingsPaymentModeConfiguration()),
      Details('Machine', 'machine', SettingsMachineScreen()),
      Details('Print', 'printer', SettingsPrintScreen()),
      Details('Release Details', 'release',
          SettingsReleaseNotesScreen(releases: _releases)),
    ]);
  }

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
        title: Text('Settings',
            style: TextStyle(color: AppColors.primaryButtonColor)),
      ),
      body: Column(
        children: [
          CommonListOfItems(
              detailsList: _settingsPages, pageController: _pageController),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) =>
                  ref.read(boolProvider.notifier).pageIndex(index),
              children: _settingsPages.map((page) => page.widget).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
