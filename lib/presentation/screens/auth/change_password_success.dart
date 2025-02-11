import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/screens/auth/register_screen.dart';
import 'package:retail_mobile/presentation/widgets/common_image_widget.dart';

class ChangePasswordSuccess extends StatelessWidget {
  const ChangePasswordSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonImageWidget(
              imageName: 'password_success',
              width: 165,
              height: 165,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Password Set Successfully!',
              style:
                  TextStyle(color: AppColors.primaryButtonColor, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'your password has been updated.\nYou can now login with your new password.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.greyColor, fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => AuthScreen()),
                      (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAA1F32),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
