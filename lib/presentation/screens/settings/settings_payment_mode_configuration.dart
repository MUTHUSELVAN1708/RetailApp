import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPaymentModeConfiguration extends StatefulWidget {
  const SettingsPaymentModeConfiguration({super.key});

  @override
  State<SettingsPaymentModeConfiguration> createState() =>
      _SettingsPaymentModeConfigurationState();
}

class _SettingsPaymentModeConfigurationState
    extends State<SettingsPaymentModeConfiguration> {
  final keyIdController = TextEditingController();
  final keySecretController = TextEditingController();
  final String razorPayUrl = 'http://www.razorpay.com';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.primaryButtonColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Razor Pay',
                  style: TextStyle(
                      color: AppColors.primaryButtonColor, fontSize: 15),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextFieldWithTitle(
              controller: keyIdController,
              hintText: 'Enter Key Id',
              label: 'Key Id',
            ),
            CustomTextFieldWithTitle(
              controller: keyIdController,
              hintText: 'Enter Secret key',
              label: 'Secret Key',
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Create New Razor Pay Account',
              style: TextStyle(color: AppColors.blackColor, fontSize: 15),
            ),
            const SizedBox(
              height: 4,
            ),
            GestureDetector(
              onTap: () async {
                final Uri uri = Uri.parse(razorPayUrl);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
              child: Text(
                razorPayUrl,
                style: const TextStyle(
                  color: Color(0xFF3FBFFF),
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryButtonColor,
                minimumSize: Size(double.infinity, 40),
              ),
              onPressed: () {},
              child: Text("Apply",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
