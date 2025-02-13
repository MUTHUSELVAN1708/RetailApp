import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/core/utils/animation.dart';
import 'package:retail_mobile/presentation/screens/cart/expandable_arrow_menu.dart';
import 'package:retail_mobile/state_management/state/floating_state.dart';

class AdvancePayment extends ConsumerStatefulWidget {
  final double totalAmount;

  const AdvancePayment({
    super.key,
    required this.totalAmount,
  });

  @override
  ConsumerState<AdvancePayment> createState() => _AdvancePaymentState();
}

class _AdvancePaymentState extends ConsumerState<AdvancePayment>
    with SingleTickerProviderStateMixin {
  final TextEditingController _advanceController = TextEditingController();

  late AppAnimation appAnimation;

  @override
  void initState() {
    super.initState();
    appAnimation = AppAnimation(vsync: this);
    appAnimation.controller.forward();
  }

  // @override
  // void dispose() {
  //   _advanceController.dispose();
  //   appAnimation.dispose();
  //   super.dispose();
  // }

  void toggleButtons() {
    ref.read(boolProvider.notifier).toggleExpanded();
    if (ref.watch(boolProvider).isExpanded) {
      appAnimation.controller.forward();
    } else {
      appAnimation.controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ref.watch(boolProvider).isExpanded) {
          ref.read(boolProvider.notifier).toggleExpanded();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryButtonColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Advance Payment',
            style: TextStyle(color: AppColors.primaryButtonColor),
          ),
          titleSpacing: -10,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Advance Payment Amount',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _advanceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Enter Advance Payment Amount',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            hintStyle: TextStyle(color: Color(0xFFCFCFCF)),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            constraints: BoxConstraints(maxHeight: 35)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Total Amount Is : ${widget.totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  // Bottom Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFAA1945),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 6),
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFAA1945),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 6),
                        ),
                        child: const Text(
                          'Print',
                          style: TextStyle(fontSize: 16),
                        ),
                      )),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () {
                          toggleButtons();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(
                              color: AppColors.primaryButtonColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            ref.watch(boolProvider).isExpanded
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            color: AppColors.whiteColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ExpandableArrowMenu(
              animation: appAnimation.animation,
              horizontalMargin: 17,
            ),
          ],
        ),
      ),
    );
  }
}
