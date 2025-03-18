import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/custom_svg.dart';

class ConfigurationPaymentOptions extends StatefulWidget {
  const ConfigurationPaymentOptions({super.key});

  @override
  State<ConfigurationPaymentOptions> createState() =>
      _ConfigurationPaymentOptionsState();
}

class _ConfigurationPaymentOptionsState
    extends State<ConfigurationPaymentOptions> {
  final List<PaymentMethod> _paymentMethods = [
    PaymentMethod(
        id: 'cash',
        name: 'Cash',
        icon: 'money',
        isFixed: true,
        isSelected: true),
    PaymentMethod(id: 'credit', name: 'Credit Customer', icon: 'card'),
    PaymentMethod(id: 'discount', name: 'Discount', icon: 'discount'),
    PaymentMethod(id: 'ewallet', name: 'E-Wallet', icon: 'e_wallet'),
    PaymentMethod(id: 'coupon', name: 'Coupon', icon: 'coupon'),
    PaymentMethod(id: 'other_cards', name: 'Other Cards', icon: 'card'),
    PaymentMethod(id: 'reward', name: 'Reward Points', icon: 'reward'),
    PaymentMethod(id: 'advance', name: 'Advance Payment', icon: 'advance_pay'),
    PaymentMethod(
        id: 'upi',
        name: 'Other UPI Payment',
        imagePath: 'assets/images/upi.png'),
    PaymentMethod(
        id: 'paytm',
        name: 'Paytm Wallet',
        imagePath: 'assets/images/paytm.png'),
    PaymentMethod(
        id: 'amazon',
        name: 'Amazon Pay',
        imagePath: 'assets/images/amazon_pay.png'),
    PaymentMethod(
        id: 'gpay',
        name: 'Google Pay',
        imagePath: 'assets/images/google_pay.png'),
    PaymentMethod(
        id: 'phonepay',
        name: 'PhonePe',
        imagePath: 'assets/images/phonepe.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _paymentMethods.length,
                  itemBuilder: (context, index) {
                    return _buildPaymentMethodItem(_paymentMethods[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryButtonColor,
                  foregroundColor: AppColors.whiteColor,
                  minimumSize: const Size.fromHeight(38),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Update', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodItem(PaymentMethod method) {
    return GestureDetector(
      onTap: () {
        if (!method.isFixed) {
          setState(() {
            method.isSelected = !method.isSelected;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: method.isSelected
                ? AppColors.primaryButtonColor
                : Colors.grey.shade300,
            width: method.isSelected ? 2.0 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            method.imagePath != null
                ? SizedBox(
                    height: 28,
                    width: 40,
                    child: Image.asset(
                      method.imagePath!,
                      fit: BoxFit.contain,
                    ),
                  )
                : CustomSvg(
                    name: method.icon!,
                    width: 40,
                    height: 40,
                    color: AppColors.primaryButtonColor,
                  ),
            const SizedBox(height: 8),
            Text(
              method.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethod {
  final String id;
  final String name;
  final String? icon;
  final String? imagePath;
  final bool isFixed;
  bool isSelected;

  PaymentMethod({
    required this.id,
    required this.name,
    this.icon,
    this.imagePath,
    this.isFixed = false,
    this.isSelected = false,
  });
}
