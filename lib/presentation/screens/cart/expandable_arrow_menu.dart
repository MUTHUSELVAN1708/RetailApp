import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/core/utils/nav_helper.dart';
import 'package:retail_mobile/presentation/screens/cart/adavance_payment.dart';
import 'package:retail_mobile/presentation/screens/cart/delete_bill.dart';
import 'package:retail_mobile/presentation/screens/cart/view_bill_screen.dart';
import 'package:retail_mobile/state_management/state/floating_state.dart';

class ExpandableArrowMenu extends ConsumerWidget {
  final Animation<Offset> animation;
  final double horizontalMargin;
  final bool isReplacement;

  const ExpandableArrowMenu(
      {super.key,
      required this.animation,
      required this.horizontalMargin,
      this.isReplacement = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: 60),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (ref.watch(boolProvider).isExpanded)
                SlideTransition(
                  position: animation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildMenuItem('Clear', () {}, ref),
                      _buildMenuItem('Hold/Resume Bill', () {}, ref),
                      _buildMenuItem('Void Bill', () {
                        NavigationHelper.slideNavigateTo(
                            context: context,
                            screen: DeleteBillDialog(),
                            isReplacement: isReplacement);
                      }, ref),
                      _buildMenuItem('Advance Payment', () {
                        NavigationHelper.slideNavigateTo(
                            context: context,
                            screen: AdvancePayment(
                              totalAmount: 100.47,
                            ),
                            isReplacement: isReplacement);
                      }, ref),
                      _buildMenuItem('View Advance Payment', () {}, ref),
                      _buildMenuItem('View Bill', () {
                        NavigationHelper.slideNavigateTo(
                            context: context,
                            screen: ViewBillScreen(),
                            isReplacement: isReplacement);
                      }, ref),
                      _buildMenuItem('Print Token', () {}, ref),
                      _buildMenuItem('Save Bill', () {}, ref),
                      _buildMenuItem('Print Bill', () {}, ref),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, void Function() onTap, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (ref.watch(boolProvider).isExpanded) {
          ref.read(boolProvider.notifier).toggleExpanded();
        }
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
            color: Color(0xFFECECEC), borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style: TextStyle(color: AppColors.primaryButtonColor),
        ),
      ),
    );
  }
}
