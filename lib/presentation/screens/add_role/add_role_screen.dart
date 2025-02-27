import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/config/common_texts.dart';
import 'package:retail_mobile/presentation/widgets/custom_button2.dart';
import 'package:retail_mobile/presentation/widgets/custom_dropdown.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class RoleManagementScreen extends StatefulWidget {
  const RoleManagementScreen({super.key});

  @override
  State<RoleManagementScreen> createState() => _RoleManagementScreenState();
}

class _RoleManagementScreenState extends State<RoleManagementScreen> {
  String? selectedRole;
  final TextEditingController roleNameController = TextEditingController();

  int? selectedRoleIndex;

  void clearForm() {
    setState(() {
      selectedRole = null;
      roleNameController.clear();
      selectedRoleIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: AppColors.primaryButtonColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Add Role',
          style: TextStyle(
            color: AppColors.primaryButtonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropdown(
                title: 'Role List',
                dropdownItems: CommonTexts.roleOptions,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRole = newValue;
                  });
                }),
            const SizedBox(height: 16),
            const Text(
              'Access Permission For Role',
              style: TextStyle(
                  color: AppColors.primaryButtonColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            const SizedBox(height: 8),
            CustomTextFieldWithTitle(
              controller: roleNameController,
              hintText: 'Enter Role Name',
              label: 'Role Name',
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: CommonTexts.allowManagement.length,
                itemBuilder: (context, index) {
                  return RadioListTile<int>(
                    title: Text(
                      CommonTexts.allowManagement[index],
                      style: TextStyle(fontSize: 15),
                    ),
                    value: index,
                    activeColor: AppColors.primaryButtonColor,
                    groupValue: selectedRoleIndex,
                    onChanged: (int? value) {
                      setState(() {
                        selectedRoleIndex = value;
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: CustomButton2(
                  text: 'Add Role',
                  isColor: true,
                  onPressed: () {},
                )),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomButton2(
                    text: 'Update',
                    isColor: true,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                    child: CustomButton2(
                  text: 'Delete Role',
                  isColor: false,
                  onPressed: () {},
                )),
                const SizedBox(width: 8),
                Expanded(
                    child: CustomButton2(
                  text: 'Clear',
                  isColor: false,
                  onPressed: () {
                    clearForm();
                  },
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
