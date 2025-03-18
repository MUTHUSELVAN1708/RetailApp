import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retail_mobile/core/utils/validators.dart';
import 'package:retail_mobile/presentation/widgets/custom_button2.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class ConfigurationRewardPointsScreen extends StatefulWidget {
  const ConfigurationRewardPointsScreen({super.key});

  @override
  State<ConfigurationRewardPointsScreen> createState() =>
      _ConfigurationRewardPointsScreenState();
}

class _ConfigurationRewardPointsScreenState
    extends State<ConfigurationRewardPointsScreen> {
  final amountEligibleController = TextEditingController();
  final rewardPointsController = TextEditingController();
  final amountEquivalentController = TextEditingController();
  final minimumRewardPointsController = TextEditingController();

  void clearForm() {
    amountEligibleController.clear();
    rewardPointsController.clear();
    amountEquivalentController.clear();
    minimumRewardPointsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFieldWithTitle(
              label: 'Amount Eligible For Reward Points',
              hintText: '0.00',
              controller: amountEligibleController,
              inputType: TextInputType.number,
              inputFormatters: [
                Validators.decimalNumber(),
              ],
            ),
            CustomTextFieldWithTitle(
              label: 'Reward Points',
              hintText: '0',
              controller: rewardPointsController,
              inputType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            CustomTextFieldWithTitle(
              label: 'Amount Equivalent To 1 Reward Point',
              hintText: '0.00',
              controller: amountEquivalentController,
              inputType: TextInputType.number,
              inputFormatters: [
                Validators.decimalNumber(),
              ],
            ),
            CustomTextFieldWithTitle(
              label: 'Minimum Reward Points To Redeem',
              hintText: '0',
              controller: minimumRewardPointsController,
              inputType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomButton2(
                  text: 'Clear',
                  isColor: false,
                  onPressed: () {
                    clearForm();
                  },
                )),
                const SizedBox(width: 8),
                Expanded(
                    child: CustomButton2(
                  text: 'Update',
                  isColor: true,
                  onPressed: () {},
                )),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
