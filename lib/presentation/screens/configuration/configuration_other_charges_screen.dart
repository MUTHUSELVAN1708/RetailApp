import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/custom_delete_dialog.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class ConfigurationOtherChargesScreen extends StatefulWidget {
  const ConfigurationOtherChargesScreen({super.key});

  @override
  State<ConfigurationOtherChargesScreen> createState() =>
      _ConfigurationOtherChargesScreenState();
}

class _ConfigurationOtherChargesScreenState
    extends State<ConfigurationOtherChargesScreen> {
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  bool isChargeable = false;
  final List<OtherCharges> otherCharges = [
    OtherCharges(
        id: '1',
        amount: 1000,
        isChargeable: true,
        description:
            "In general, the gross composition of cow's milk in the U.S. is 87.7% water, 4.9% lactose (carbohydrate), 3.4% fat, 3.3% protein, and 0.7% minerals (referred to as ash)."),
    OtherCharges(
        id: '2',
        amount: 750,
        isChargeable: false,
        description:
            "In general, the gross composition of cow's milk in the U.S. is 87.7% water, 4.9% lactose (carbohydrate), 3.4% fat, 3.3% protein, and 0.7% minerals (referred to as ash)."),
  ];

  void _addOtherCharges() {
    if (descriptionController.text.isNotEmpty &&
        amountController.text.isNotEmpty) {
      setState(() {
        otherCharges.add(OtherCharges(
            id: (otherCharges.length + 1).toString(),
            description: descriptionController.text,
            amount: double.parse(amountController.text),
            isChargeable: isChargeable));
        descriptionController.clear();
        amountController.clear();
        isChargeable = false;
      });
    }
  }

  void _deleteOtherCharges(int index) {
    setState(() {
      otherCharges.removeAt(index);
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
            label: 'Description',
            hintText: 'Enter Description',
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
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isChargeable = !isChargeable;
                  });
                },
                child: Icon(
                  !isChargeable
                      ? Icons.circle_outlined
                      : Icons.check_circle_sharp,
                  color: AppColors.primaryButtonColor,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Chargeable',
                style: TextStyle(fontSize: 16),
              )
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
              _addOtherCharges();
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
              itemCount: otherCharges.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return OtherChargesItem(
                  otherCharges: otherCharges[index],
                  onDelete: () => _deleteOtherCharges(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OtherChargesItem extends StatelessWidget {
  final OtherCharges otherCharges;
  final VoidCallback onDelete;

  const OtherChargesItem({
    super.key,
    required this.otherCharges,
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
                'Description  ',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                ' : ',
                style: TextStyle(fontSize: 14),
              ),
              Expanded(
                child: Text(
                  otherCharges.description,
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
                          title: 'Other Changes',
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
                'Amount         ',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                ' : ',
                style: TextStyle(fontSize: 14),
              ),
              Expanded(
                child: Text(
                  '${otherCharges.amount}',
                  style: const TextStyle(fontSize: 14),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'IsChargeable',
                style: TextStyle(fontSize: 14),
              ),
              const Text(
                ' : ',
                style: TextStyle(fontSize: 14),
              ),
              Expanded(
                child: Text(
                  otherCharges.isChargeable ? 'Yes' : 'No',
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

class OtherCharges {
  final String description;
  final double amount;
  final bool isChargeable;
  final String id;

  OtherCharges(
      {required this.description,
      required this.id,
      required this.amount,
      required this.isChargeable});
}
