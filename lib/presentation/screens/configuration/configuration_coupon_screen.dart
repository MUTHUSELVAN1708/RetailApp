import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/custom_delete_dialog.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class ConfigurationCouponScreen extends StatefulWidget {
  const ConfigurationCouponScreen({super.key});

  @override
  State<ConfigurationCouponScreen> createState() =>
      _ConfigurationCouponScreenState();
}

class _ConfigurationCouponScreenState extends State<ConfigurationCouponScreen> {
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  final List<Coupon> coupons = [
    Coupon(
        id: '1',
        amount: 1000,
        description:
            "In general, the gross composition of cow's milk in the U.S. is 87.7% water, 4.9% lactose (carbohydrate), 3.4% fat, 3.3% protein, and 0.7% minerals (referred to as ash)."),
    Coupon(
        id: '2',
        amount: 750,
        description:
            "In general, the gross composition of cow's milk in the U.S. is 87.7% water, 4.9% lactose (carbohydrate), 3.4% fat, 3.3% protein, and 0.7% minerals (referred to as ash)."),
  ];

  void _addCoupon() {
    if (descriptionController.text.isNotEmpty &&
        amountController.text.isNotEmpty) {
      setState(() {
        coupons.add(Coupon(
          id: (coupons.length + 1).toString(),
          description: descriptionController.text,
          amount: double.parse(amountController.text),
        ));
        descriptionController.clear();
        amountController.clear();
      });
    }
  }

  void _deleteCoupon(int index) {
    setState(() {
      coupons.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFieldWithTitle(
            label: 'Coupon Description',
            hintText: 'Enter Coupon Description',
            controller: descriptionController,
          ),
          CustomTextFieldWithTitle(
            label: 'Amount',
            hintText: 'Enter Amount',
            controller: amountController,
            inputType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryButtonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minimumSize: Size(double.infinity, 38),
            ),
            onPressed: () {
              _addCoupon();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline_outlined,
                  color: AppColors.whiteColor,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text("Add",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: coupons.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return CouponItem(
                  coupon: coupons[index],
                  onDelete: () => _deleteCoupon(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CouponItem extends StatelessWidget {
  final Coupon coupon;
  final VoidCallback onDelete;

  const CouponItem({
    super.key,
    required this.coupon,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Description',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                ' : ',
                style: TextStyle(fontSize: 14),
              ),
              Expanded(
                child: Text(
                  coupon.description,
                  style: const TextStyle(fontSize: 14),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      width: 20,
                      child: Icon(Icons.edit,
                          color: AppColors.primaryButtonColor, size: 20),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => CustomDeleteDialog(
                          title: 'Coupon',
                          onDelete: onDelete,
                          showAdditionalWarning: false,
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 20,
                      child: Icon(Icons.delete,
                          color: AppColors.primaryButtonColor, size: 20),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Amount      ',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                ' : ',
                style: TextStyle(fontSize: 14),
              ),
              Expanded(
                child: Text(
                  '${coupon.amount}',
                  style: const TextStyle(fontSize: 14),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Coupon {
  final String description;
  final double amount;
  final String id;

  Coupon({required this.description, required this.id, required this.amount});
}
