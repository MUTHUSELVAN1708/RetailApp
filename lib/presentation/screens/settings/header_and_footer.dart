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
  final _jurisdictionsController = TextEditingController();

  final List<TextEditingController> _headerControllers =
      List.generate(5, (_) => TextEditingController());
  final List<TextEditingController> _footerControllers =
      List.generate(5, (_) => TextEditingController());

  String? _titleDropdown;
  final List<String?> _headerDropdowns = List.generate(5, (_) => null);
  final List<String?> _footerDropdowns = List.generate(5, (_) => null);
  String? _jurisdictionsDropdown;

  String selectedOption = 'Normal';
  List<String> options = ['Normal', 'Dw', 'DH And DW'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 16),
          itemCount: 12,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _buildFieldWithDropdown(
                controller: _titleController,
                label: 'Title',
                value: _titleDropdown,
                onChanged: (value) => setState(() => _titleDropdown = value),
              );
            } else if (index <= 5) {
              int headerIndex = index - 1;
              return _buildFieldWithDropdown(
                controller: _headerControllers[headerIndex],
                label: 'Header Text Line ${headerIndex + 1}',
                value: _headerDropdowns[headerIndex],
                onChanged: (value) =>
                    setState(() => _headerDropdowns[headerIndex] = value),
              );
            } else if (index <= 10) {
              int footerIndex = index - 6;
              return _buildFieldWithDropdown(
                controller: _footerControllers[footerIndex],
                label: 'Footer Text Line ${footerIndex + 1}',
                value: _footerDropdowns[footerIndex],
                onChanged: (value) =>
                    setState(() => _footerDropdowns[footerIndex] = value),
              );
            } else {
              return _buildFieldWithDropdown(
                controller: _jurisdictionsController,
                label: 'Jurisdictions Text',
                value: _jurisdictionsDropdown,
                onChanged: (value) =>
                    setState(() => _jurisdictionsDropdown = value),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryButtonColor,
              padding: EdgeInsets.symmetric(vertical: 6),
            ),
            child: Text(
              'Apply',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              constraints: BoxConstraints(maxHeight: 35),
              hintText: label,
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
              suffixIcon: PopupMenuButton<String>(
                icon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Font', style: TextStyle(color: Colors.black)),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      height: 20,
                      value: option,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(option),
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
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _jurisdictionsController.dispose();
    for (var controller in _headerControllers) {
      controller.dispose();
    }
    for (var controller in _footerControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
