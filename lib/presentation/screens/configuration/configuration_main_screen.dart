import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/screens/configuration/configuration_brand_screen.dart';
import 'package:retail_mobile/presentation/screens/configuration/configuration_category_screen.dart';
import 'package:retail_mobile/presentation/screens/configuration/configuration_coupon_screen.dart';
import 'package:retail_mobile/presentation/screens/configuration/configuration_department_screen.dart';
import 'package:retail_mobile/presentation/screens/configuration/configuration_discount_screen.dart';
import 'package:retail_mobile/presentation/screens/configuration/configuration_other_charges_screen.dart';
import 'package:retail_mobile/presentation/screens/configuration/configuration_payment_options.dart';
import 'package:retail_mobile/presentation/screens/configuration/configuration_payment_receipt_screen.dart';
import 'package:retail_mobile/presentation/screens/configuration/configuration_quick_access_qty.dart';
import 'package:retail_mobile/presentation/screens/configuration/configuration_reward_points_screen.dart';
import 'package:retail_mobile/presentation/screens/settings/header_and_footer.dart';
import 'package:retail_mobile/presentation/screens/settings/settings_gst_screen.dart';
import 'package:retail_mobile/presentation/screens/settings/settings_machine_screen.dart';
import 'package:retail_mobile/presentation/screens/settings/settings_other_screen.dart';
import 'package:retail_mobile/presentation/screens/settings/settings_payment_mode_configuration.dart';
import 'package:retail_mobile/presentation/screens/settings/settings_print_screen.dart';
import 'package:retail_mobile/presentation/screens/store_details/add_store_details.dart';
import 'package:retail_mobile/presentation/widgets/common_list_of_items.dart';
import 'package:retail_mobile/state_management/state/floating_state.dart';

class ConfigurationMainScreen extends ConsumerStatefulWidget {
  const ConfigurationMainScreen({super.key});

  @override
  ConsumerState createState() => _ConfigurationMainScreenState();
}

class _ConfigurationMainScreenState
    extends ConsumerState<ConfigurationMainScreen> {
  final PageController _pageController = PageController();

  final List<Details> configurationPages = [];

  @override
  void initState() {
    super.initState();
    configurationPages.addAll([
      // Details('Department', 'group_two', ConfigurationQuickAccessQty()),
      Details('Department', 'group_two', DepartmentScreen()),
      Details('Category', 'category', ConfigurationCategoryScreen()),
      Details('Brand', 'shop_icon', ConfigurationBrandScreen()),
      Details(
          'Payment/Receipt', 'bill_list', ConfigurationPaymentReceiptScreen()),
      Details('Discount', 'discount', ConfigurationDiscountScreen()),
      Details('Coupon', 'coupon', ConfigurationCouponScreen()),
      Details('Other Charges', 'other', ConfigurationOtherChargesScreen()),
      Details('Reward Points', 'reward', ConfigurationRewardPointsScreen()),
      Details(
          'Payment Options', 'payment_option', ConfigurationPaymentOptions()),
      Details('Quick Access Qty', 'bag_smile', ConfigurationQuickAccessQty()),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryButtonColor,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Configuration',
            style: TextStyle(color: AppColors.primaryButtonColor)),
      ),
      body: Column(
        children: [
          CommonListOfItems(
              detailsList: configurationPages, pageController: _pageController),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) =>
                  ref.read(boolProvider.notifier).configurationPageIndex(index),
              children: configurationPages.map((page) => page.widget).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
