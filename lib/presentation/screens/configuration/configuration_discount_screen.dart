import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/custom_delete_dialog.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class ConfigurationDiscountScreen extends StatefulWidget {
  const ConfigurationDiscountScreen({super.key});

  @override
  State<ConfigurationDiscountScreen> createState() =>
      _ConfigurationDiscountScreenState();
}

class _ConfigurationDiscountScreenState
    extends State<ConfigurationDiscountScreen> {
  final descriptionController = TextEditingController();
  final percentController = TextEditingController();
  final List<Discount> discounts = [
    Discount(
        id: '1',
        percent: 80,
        description:
            "In general, the gross composition of cow's milk in the U.S. is 87.7% water, 4.9% lactose (carbohydrate), 3.4% fat, 3.3% protein, and 0.7% minerals (referred to as ash)."),
    Discount(
        id: '2',
        percent: 75,
        description:
            "In general, the gross composition of cow's milk in the U.S. is 87.7% water, 4.9% lactose (carbohydrate), 3.4% fat, 3.3% protein, and 0.7% minerals (referred to as ash)."),
  ];

  void _addDiscount() {
    if (descriptionController.text.isNotEmpty &&
        percentController.text.isNotEmpty) {
      setState(() {
        discounts.add(Discount(
          id: (discounts.length + 1).toString(),
          description: descriptionController.text,
          percent: double.parse(percentController.text),
        ));
        descriptionController.clear();
        percentController.clear();
      });
    }
  }

  void _deleteDiscount(int index) {
    setState(() {
      discounts.removeAt(index);
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
            label: 'Discount Description',
            hintText: 'Enter Discount Description',
            controller: descriptionController,
          ),
          CustomTextFieldWithTitle(
            label: 'Discount (%)',
            hintText: 'Enter Discount (%)',
            controller: percentController,
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
              _addDiscount();
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
              itemCount: discounts.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return DiscountItem(
                  discount: discounts[index],
                  onDelete: () => _deleteDiscount(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DiscountItem extends StatelessWidget {
  final Discount discount;
  final VoidCallback onDelete;

  const DiscountItem({
    super.key,
    required this.discount,
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
                  discount.description,
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
                          title: 'Discount',
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
                'Percent       ',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                ' : ',
                style: TextStyle(fontSize: 14),
              ),
              Expanded(
                child: Text(
                  '${discount.percent}%',
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

class Discount {
  final String description;
  final double percent;
  final String id;

  Discount(
      {required this.description, required this.id, required this.percent});
}
