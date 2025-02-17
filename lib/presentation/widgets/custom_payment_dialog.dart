import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';

class CustomPaymentDialog extends StatelessWidget {
  final String paymentMethod;
  final String amount;

  const CustomPaymentDialog({
    super.key,
    required this.paymentMethod,
    required this.amount,
  });

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
              Image.asset('assets/images/dollor.png'),
              const SizedBox(height: 20),
              const Text(
                'Enter Amount',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryButtonColor,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        paymentMethod,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: TextEditingController(text: amount),
                        cursorHeight: 15,
                        decoration: InputDecoration(
                            hintText: '0.00',
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
                ],
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Amount to pay: +$amount',
                  style: const TextStyle(
                    color: Color(0xFFB6B6B6),
                    fontSize: 14,
                  ),
                ),
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
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Color(0xFF676767), fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
