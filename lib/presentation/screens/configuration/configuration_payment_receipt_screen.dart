import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/custom_delete_dialog.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class ConfigurationPaymentReceiptScreen extends StatefulWidget {
  const ConfigurationPaymentReceiptScreen({super.key});

  @override
  State<ConfigurationPaymentReceiptScreen> createState() =>
      _ConfigurationBrandScreenState();
}

class _ConfigurationBrandScreenState
    extends State<ConfigurationPaymentReceiptScreen> {
  final TextEditingController expenditureNameController =
      TextEditingController();
  final List<Expenditure> expenditures = [
    Expenditure(
        id: '1',
        description:
            "In general, the gross composition of cow's milk in the U.S. is 87.7% water, 4.9% lactose (carbohydrate), 3.4% fat, 3.3% protein, and 0.7% minerals (referred to as ash)."),
    Expenditure(
        id: '2',
        description:
            "In general, the gross composition of cow's milk in the U.S. is 87.7% water, 4.9% lactose (carbohydrate), 3.4% fat, 3.3% protein, and 0.7% minerals (referred to as ash)."),
  ];

  void _addExpenditure() {
    if (expenditureNameController.text.isNotEmpty) {
      setState(() {
        expenditures.add(Expenditure(
          id: (expenditures.length + 1).toString(),
          description: expenditureNameController.text,
        ));
        expenditureNameController.clear();
      });
    }
  }

  void _deleteExpenditure(int index) {
    setState(() {
      expenditures.removeAt(index);
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
            label: 'Expenditure Name',
            hintText: 'Enter Expenditure Name',
            controller: expenditureNameController,
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
              _addExpenditure();
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
              itemCount: expenditures.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return ExpenditureItem(
                  expenditure: expenditures[index],
                  onDelete: () => _deleteExpenditure(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenditureItem extends StatelessWidget {
  final Expenditure expenditure;
  final VoidCallback onDelete;

  const ExpenditureItem({
    super.key,
    required this.expenditure,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: TextStyle(fontSize: 14),
                ),
                const Text(
                  ' : ',
                  style: TextStyle(fontSize: 14),
                ),
                Expanded(
                  child: Text(
                    expenditure.description,
                    style: const TextStyle(fontSize: 14),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // Action buttons
          Row(
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
                      title: 'Payment/Receipt',
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
    );
  }
}

class Expenditure {
  final String description;
  final String id;

  Expenditure({required this.description, required this.id});
}
