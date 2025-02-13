import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';

class ShiftEndDialog extends StatefulWidget {
  const ShiftEndDialog({super.key});

  @override
  State<ShiftEndDialog> createState() => _ShiftEndDialogState();
}

class _ShiftEndDialogState extends State<ShiftEndDialog> {
  final TextEditingController _adjustmentController = TextEditingController();
  final TextEditingController _adjustmentReasonController =
      TextEditingController();

  final List<Map<String, dynamic>> paymentModes = [
    {'mode': 'Cash', 'amount': 0.00},
    {'mode': 'Card', 'amount': 0.00},
    {'mode': 'Coupon', 'amount': 0.00},
    {'mode': 'Pettycash', 'amount': 0.00},
    {'mode': 'Wallet', 'amount': 0.00},
    {'mode': 'Reward Points', 'amount': 0.00},
    {'mode': 'Paytm', 'amount': 0.00},
  ];

  @override
  void dispose() {
    _adjustmentController.dispose();
    _adjustmentReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Shift End',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryButtonColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // Payment Modes Header
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                    color: AppColors.primaryButtonColor,
                    borderRadius: BorderRadius.circular(8)),
                child: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Payment Mode',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Total',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Payment Modes List
              ...paymentModes.map((mode) => Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            mode['mode'],
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          mode['amount'].toStringAsFixed(2),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 10),
              const Text(
                'Adjustment',
                style: TextStyle(
                  color: Color(0xFFAA1945),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _adjustmentController,
                keyboardType: TextInputType.number,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: '0.00',
                  hintStyle: TextStyle(
                      color: _adjustmentController.text.isNotEmpty
                          ? AppColors.blackColor
                          : Color(0xFF848484)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: AppColors.primaryButtonColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: AppColors.primaryButtonColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide:
                        const BorderSide(color: AppColors.primaryButtonColor),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  constraints: const BoxConstraints(maxHeight: 35),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Adjustment Reason',
                style: TextStyle(
                  color: AppColors.primaryButtonColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                readOnly: true,
                controller: _adjustmentReasonController,
                decoration: InputDecoration(
                  hintText: 'Adjustment Reason',
                  hintStyle: TextStyle(
                      color: _adjustmentReasonController.text.isNotEmpty
                          ? AppColors.blackColor
                          : Color(0xFF848484)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: AppColors.primaryButtonColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: AppColors.primaryButtonColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: AppColors.primaryButtonColor,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  constraints: const BoxConstraints(maxHeight: 35),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryButtonColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'RePrint',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
