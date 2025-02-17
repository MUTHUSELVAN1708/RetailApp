import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retail_mobile/config/app_colors.dart';

class HeaderAndFooter extends ConsumerStatefulWidget {
  const HeaderAndFooter({super.key});

  @override
  ConsumerState createState() => _HeaderAndFooterState();
}

class _HeaderAndFooterState extends ConsumerState<HeaderAndFooter> {
  final _titleController = TextEditingController();
  final _headerControllers = List.generate(5, (_) => TextEditingController());
  final _footerControllers = List.generate(5, (_) => TextEditingController());
  final _jurisdictionsController = TextEditingController();

  String selectedOption = 'Normal';
  List<String> options = ['Normal', 'Dw', 'DH And DW'];

  String? _titleDropdown;
  final List<String?> _headerDropdowns = List.generate(5, (_) => null);
  final List<String?> _footerDropdowns = List.generate(5, (_) => null);
  String? _jurisdictionsDropdown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 5),
        child: Column(
          children: [
            _buildFieldWithDropdown(
              controller: _titleController,
              label: 'Title',
              value: _titleDropdown,
              onChanged: (value) => setState(() => _titleDropdown = value),
            ),
            SizedBox(height: 16),
            ...List.generate(5, (index) {
              return Column(
                children: [
                  _buildFieldWithDropdown(
                    controller: _headerControllers[index],
                    label: 'Header Text Line ${index + 1}',
                    value: _headerDropdowns[index],
                    onChanged: (value) =>
                        setState(() => _headerDropdowns[index] = value),
                  ),
                  SizedBox(height: 16),
                ],
              );
            }),

            // Footer text fields with dropdowns
            ...List.generate(5, (index) {
              return Column(
                children: [
                  _buildFieldWithDropdown(
                    controller: _footerControllers[index],
                    label: 'Footer Text Line ${index + 1}',
                    value: _footerDropdowns[index],
                    onChanged: (value) =>
                        setState(() => _footerDropdowns[index] = value),
                  ),
                  SizedBox(height: 16),
                ],
              );
            }),

            // Jurisdictions field with dropdown
            _buildFieldWithDropdown(
              controller: _jurisdictionsController,
              label: 'Jurisdictions Text',
              value: _jurisdictionsDropdown,
              onChanged: (value) =>
                  setState(() => _jurisdictionsDropdown = value),
            ),
            SizedBox(height: 24),

            // Apply button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryButtonColor,
                  padding: EdgeInsets.symmetric(vertical: 6),
                ),
                child: Text(
                  'Apply',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldWithDropdown({
    required TextEditingController controller,
    required String label,
    required String? value,
    required void Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            constraints: BoxConstraints(maxHeight: 35),
            hintText: label,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(),
            suffixIcon: PopupMenuButton<String>(
              icon: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Font',
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(Icons.keyboard_arrow_down_outlined),
                  ],
                ),
              ),
              onSelected: (String value) {
                setState(() {
                  selectedOption = value;
                });
              },
              itemBuilder: (BuildContext context) {
                return options.map((String option) {
                  return PopupMenuItem<String>(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    height: 20,
                    value: option,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(option),
                        SizedBox(width: 8),
                        if (selectedOption == option)
                          Icon(Icons.radio_button_checked,
                              color: AppColors.primaryButtonColor)
                        else
                          Icon(Icons.radio_button_unchecked,
                              color: Colors.grey),
                      ],
                    ),
                  );
                }).toList();
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    for (var controller in _headerControllers) {
      controller.dispose();
    }
    for (var controller in _footerControllers) {
      controller.dispose();
    }
    _jurisdictionsController.dispose();
    super.dispose();
  }
}
