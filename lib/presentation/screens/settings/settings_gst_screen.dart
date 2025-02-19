import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';

class SettingsGstScreen extends StatefulWidget {
  const SettingsGstScreen({super.key});

  @override
  State<SettingsGstScreen> createState() => _SettingsGstScreenState();
}

class _SettingsGstScreenState extends State<SettingsGstScreen> {
  String utGst = 'Enable';
  String hsnCode = 'Enable';
  String printHsn = 'Enable';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildColumn('UTGST (Choose one)', 'Enable', 'Disable', utGst),
            _buildColumn('Print HSN in Bill (Choose one)', 'Enable', 'Disable',
                printHsn),
            _buildColumn('HSN code', 'Enable', 'Disable', hsnCode),
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

  Widget _buildColumn(
      String title, String value1, String value2, String selectedValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildRadioOption(
              value: value1,
              groupValue: selectedValue,
              onChanged: (value) => setState(() => selectedValue = value!),
            ),
            const SizedBox(width: 24),
            _buildRadioOption(
              value: value2,
              groupValue: selectedValue,
              onChanged: (value) => setState(() => selectedValue = value!),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildRadioOption({
    required String value,
    required String groupValue,
    required Function(String?) onChanged,
  }) {
    final bool isSelected = value == groupValue;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 20,
          child: Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: AppColors.primaryButtonColor,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          value,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
