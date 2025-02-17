import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';

class SettingsOtherScreen extends StatefulWidget {
  const SettingsOtherScreen({super.key});

  @override
  State<SettingsOtherScreen> createState() => _SettingsOptionsState();
}

class _SettingsOptionsState extends State<SettingsOtherScreen> {
  String discountType = 'Itemwise';
  String taxType = 'Pre-Tax';
  String mrpEnabled = 'Enable';
  String billingMode = 'Items';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildColumn('Date & Time', 'Auto', 'Manual', mrpEnabled),
          _buildColumn('Price Change', 'Enable', 'Disable', discountType),
          _buildColumn('Bill with stock', 'Enable', 'Disable', taxType),
          _buildColumn('Bill no daily reset', 'Enable', 'Disable', mrpEnabled),
          _buildColumn(
              'Bill amount round off', 'Enable', 'Disable', mrpEnabled),
          _buildColumn(
              'Sales man iD display', 'Enable', 'Disable', discountType),
          _buildColumn('Expiry date', 'Enable', 'Disable', taxType),
          _buildColumn('Header print bold', 'Enable', 'Disable', mrpEnabled),
          _buildColumn(
              'Automatic stock download', 'Enable', 'Disable', mrpEnabled),
          _buildColumn(
              'Exchange bill Print Option', 'Enable', 'Disable', discountType),
          _buildColumn('Tax', 'Forward', 'Reverse', taxType),
          _buildColumn('Discount Type', 'Itemwise', 'BillWise', discountType),
          _buildColumn('Apply Discount (Forward Tax-Billwise)', 'Pre-Tax',
              'Post-Tax', taxType),
          _buildColumn('MRP (Rate Price Difference Print)', 'Enable', 'Disable',
              mrpEnabled),
          const Text(
            'Fast Billing Mode',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 24,
            runSpacing: -12,
            children: [
              _buildRadioOption(
                value: 'Items',
                groupValue: billingMode,
                onChanged: (value) => setState(() => billingMode = value!),
              ),
              _buildRadioOption(
                value: 'Dept/Items',
                groupValue: billingMode,
                onChanged: (value) => setState(() => billingMode = value!),
              ),
              _buildRadioOption(
                value: 'Brand/Items',
                groupValue: billingMode,
                onChanged: (value) => setState(() => billingMode = value!),
              ),
              _buildRadioOption(
                value: 'Dept/Categ/Items',
                groupValue: billingMode,
                onChanged: (value) => setState(() => billingMode = value!),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildColumn('Reward Points', 'Enable', 'Disable', taxType),
          _buildColumn('Display Inactive Entities in Reports', 'Enable',
              'Disable', mrpEnabled),
          _buildColumn('Bill Amount Font Options', 'Bold', 'DH', mrpEnabled),
          _buildColumn(
              'Jurisdictions Print', 'Enable', 'Disable', discountType),
          _buildColumn('Cumulative Billing', 'Enable', 'Disable', taxType),
          _buildColumn('Open Price', 'Enable', 'Disable', mrpEnabled),
          _buildColumn('Share Bill', 'Bold', 'DH', mrpEnabled),
          _buildColumn('Training Mode', 'Enable', 'Disable', discountType),
          _buildColumn(
              'Item\'s Name Print In Bill', 'Long Name', 'Short Name', taxType),
          _buildColumn('Print Item Wise Discount In Bill', 'Enable', 'Disable',
              mrpEnabled),
          _buildColumn('Standalone Status', 'Bold', 'DH', mrpEnabled),
          _buildColumn(
              'Display Discount Message', 'Enable', 'Disable', discountType),
          _buildColumn('Two Copy Bill Print', 'Enable', 'Disable', taxType),
          _buildColumn(
              'Multiple Salesman Bill Amount', 'Enable', 'Disable', mrpEnabled),
          _buildColumn('Rupee Billing Display', 'Bold', 'DH', mrpEnabled),
          _buildColumn('Quick Access Qty', 'Enable', 'Disable', discountType),
          _buildColumn('Bulk Break', 'Enable', 'Disable', taxType),
          _buildColumn('Shift End', 'Enable', 'Disable', mrpEnabled),
          _buildColumn('Print User Name', 'Bold', 'DH', mrpEnabled),
          _buildColumn('Delete Option (Items, Customers and Suppliers)',
              'Enable', 'Disable', discountType),
          _buildColumn('Print Customer Address', 'Enable', 'Disable', taxType),
          _buildColumn('Print Reward Points', 'Enable', 'Disable', mrpEnabled),

        ],
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
