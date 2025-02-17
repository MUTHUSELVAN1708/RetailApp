import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';

class RewardDialog extends StatefulWidget {
  final String title;

  // final List<String> labels;

  const RewardDialog({
    super.key,
    required this.title,
    // required this.labels,
  });

  @override
  State<RewardDialog> createState() => _RewardDialogState();
}

class _RewardDialogState extends State<RewardDialog> {
  final mobileNoController = TextEditingController();
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final pointController = TextEditingController();
  final payNoController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    mobileNoController.dispose();
    nameController.dispose();
    amountController.dispose();
    pointController.dispose();
    payNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 280,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryButtonColor,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  textField(mobileNoController, 'Mobile No'),
                  textField(nameController, 'Name'),
                  textField(
                      amountController,
                      widget.title == 'Patty Cash'
                          ? 'Credit Amount'
                          : 'Total Reward Point Accumulated'),
                  textField(
                      pointController,
                      widget.title == 'Patty Cash'
                          ? 'Credit Limit'
                          : 'Limit To Redeem Reward Point'),
                  textField(
                      pointController,
                      widget.title == 'Patty Cash'
                          ? 'Amount To Pay'
                          : 'Reward points to Redeem'),
                ],
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryButtonColor,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  widget.title == 'Patty Cash' ? 'Pay' : 'Redeem',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget textField(TextEditingController controller, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(title),
        const SizedBox(
          height: 10,
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: controller,
          cursorHeight: 15,
          decoration: InputDecoration(
              hintText: 'Enter $title',
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
    );
  }
}
