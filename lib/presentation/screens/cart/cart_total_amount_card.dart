import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/screens/cart/bill_screen.dart';
import 'package:retail_mobile/presentation/widgets/custom_button.dart';
import 'package:retail_mobile/state_management/state/floating_state.dart';

class CartTotalAmountCard extends ConsumerStatefulWidget {
  final bool isViewBill;
  final bool isBillSection;
  final AnimationController controller;

  const CartTotalAmountCard(
      {super.key,
      required this.isViewBill,
      required this.controller,
      this.isBillSection = false});

  @override
  ConsumerState createState() => _CartTotalAmountCardState();
}

class _CartTotalAmountCardState extends ConsumerState<CartTotalAmountCard>
    with SingleTickerProviderStateMixin {
  void toggleButtons() {
    ref.read(boolProvider.notifier).toggleExpanded();
    if (ref.watch(boolProvider).isExpanded) {
      widget.controller.forward();
    } else {
      widget.controller.reverse();
    }
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: (!widget.isViewBill && !widget.isBillSection) ? 200 : null,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                if (!widget.isViewBill || widget.isBillSection) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCheckbox("MRP", true),
                      _buildCheckbox("Retail price", false),
                      _buildCheckbox("Whole Sale Price", false),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
                if (!widget.isViewBill || widget.isBillSection)
                  _buildRow("Total Qty", "45"),
                _buildRow("Discount", "(5%) \$45"),
                _buildRowBold("Round Off", "Rs 415.00/-",
                    color: Color(0xFF4D4D4D)),
                _buildRow("IGST Amount", "Rs 5.00/-"),
                _buildRow("CGST Amount", "Rs 5.00/-"),
                _buildRow("SGST Amount", "Rs 5.00/-"),
                _buildRow("Cess Amount", "Rs 5.00/-"),
                _buildRow("Total Taxable Value", "Rs 5.00/-"),
                _buildRow("Other Charges", "Rs 5.00/-"),
                _buildRowBold("Total Amount", "Rs 710.00/-",
                    color: AppColors.primaryButtonColor),
                SizedBox(height: 10),
                if (widget.isViewBill) ...[
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomButton(
                              text: "Clear",
                              color: AppColors.primaryButtonColor,
                              onTap: () {}),
                        ),
                        Expanded(
                          child: CustomButton(
                              text: "Share",
                              color: AppColors.primaryButtonColor,
                              onTap: () {}),
                        ),
                        Expanded(
                          child: CustomButton(
                              text: "Reprint Token",
                              color: AppColors.primaryButtonColor,
                              onTap: () {}),
                        ),
                        Expanded(
                            child: CustomButton(
                                text: "Reprint Bill",
                                color: Color(0xFF3D3D3D),
                                onTap: () {})),
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
                  ),
                ] else if (widget.isBillSection) ...[
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomButton(
                              text: "Pay",
                              color: AppColors.primaryButtonColor,
                              onTap: () {}),
                        ),
                        Expanded(
                          child: CustomButton(
                            text: "Pay & Print",
                            color: AppColors.primaryButtonColor,
                            onTap: () {},
                          ),
                        ),
                        Expanded(
                            child: CustomButton(
                          text: "Cancel",
                          color: Color(0xFF3D3D3D),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        )),
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
                  ),
                ] else ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryButtonColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minimumSize: Size(double.infinity, 35),
                          ),
                          onPressed: () {
                            if (ref.watch(boolProvider).isExpanded) {
                              ref.read(boolProvider.notifier).toggleExpanded();
                            }
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return BillScreen();
                            }));
                          },
                          child: Text("Continue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis)),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
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
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckbox(String title, bool isActive) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            height: 20,
            width: 20,
            child: Checkbox(
              activeColor: AppColors.primaryButtonColor,
              side: BorderSide(color: AppColors.primaryButtonColor),
              value: isActive,
              onChanged: (value) {},
            )),
        const SizedBox(
          width: 4,
        ),
        Text(title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryButtonColor)),
      ],
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14, color: Color(0xFF4D4D4D))),
          Text(value, style: TextStyle(fontSize: 14, color: Color(0xFF4D4D4D))),
        ],
      ),
    );
  }

  Widget _buildRowBold(String label, String value,
      {Color color = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: color)),
          Text(value,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
