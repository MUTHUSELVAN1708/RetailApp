import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class SettingsMachineScreen extends StatefulWidget {
  const SettingsMachineScreen({super.key});

  @override
  State<SettingsMachineScreen> createState() => _SettingsMachineScreenState();
}

class _SettingsMachineScreenState extends State<SettingsMachineScreen> {
  final dataSyncController = TextEditingController();
  final newBillController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Software Version V2.4.2PS",
                style: TextStyle(
                    color: AppColors.primaryButtonColor,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            _buildButton(
                "Restore Default",
                title: 'Restore default (Only settings are reset)',
                AppColors.primaryButtonColor),
            SizedBox(height: 16),
            _buildButton(
                "Back Up", title: 'Back up', AppColors.primaryButtonColor),
            SizedBox(height: 16),
            CustomTextFieldWithTitle(
              controller: dataSyncController,
              hintText: '4 Hours',
              label: 'Mobile data sync time interval',
            ),
            CustomTextFieldWithTitle(
              controller: newBillController,
              hintText: 'Enter New bill no',
              label: 'New bill no',
            ),
            SizedBox(height: 16),
            _buildButton(
                "Restore Default",
                title: 'Restore default',
                AppColors.primaryButtonColor),
            SizedBox(height: 16),
            _buildButton(
                "Factory Reset",
                title: 'Factory reset(deletes all current data&settings)',
                AppColors.primaryButtonColor),
            SizedBox(height: 16),
            _buildButton(
                "Restore Data",
                title: 'Restore Device data',
                AppColors.primaryButtonColor),
            SizedBox(height: 16),
            Text("Data Backup Is % Is 0.0",
                style: TextStyle(color: AppColors.blackColor)),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildButton("Save", AppColors.primaryButtonColor,
                    isFullWidth: false),
                _buildButton("Apply", AppColors.primaryButtonColor,
                    isFullWidth: false),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color,
      {bool isFullWidth = true, String? title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(title, style: TextStyle(fontSize: 15)),
          SizedBox(height: 5),
        ],
        SizedBox(
          width: isFullWidth ? double.infinity : 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isFullWidth
                  ? AppColors.whiteColor
                  : AppColors.primaryButtonColor,
              side: BorderSide(color: AppColors.primaryButtonColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
            onPressed: () {
              if (isFullWidth) {
                _showAuthorizationDialog(context);
              }
            },
            child: Text(text,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isFullWidth
                        ? AppColors.primaryButtonColor
                        : AppColors.whiteColor)),
          ),
        ),
      ],
    );
  }

  void _showAuthorizationDialog(BuildContext context) {
    showDialog(
      barrierColor: Color(0xFF9E122C).withValues(alpha: 0.4),
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Center(
          child: Text("Authorization",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryButtonColor)),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 50),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFieldWithTitle(
              controller: dataSyncController,
              hintText: 'Enter email',
              label: 'Admin email',
            ),
            CustomTextFieldWithTitle(
              controller: newBillController,
              hintText: 'Enter password',
              label: 'Admin password',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryButtonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              ),
              onPressed: () {},
              child: Text("Proceed",
                  style: TextStyle(fontSize: 16, color: AppColors.whiteColor)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel",
                  style: TextStyle(color: AppColors.blackColor, fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
