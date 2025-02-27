import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/core/utils/helper.dart';
import 'package:retail_mobile/presentation/widgets/common_date_picker.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _aadhaarController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String? selectedRole;
  bool isActive = false;

  final List<String> roles = ["Admin", "Manager", "User"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryButtonColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("User Management",
            style: TextStyle(
                color: AppColors.primaryButtonColor,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16.0, right: 16, bottom: 16, top: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFieldWithTitle(
                  controller: _nameController,
                  hintText: 'Enter Name',
                  label: 'Name',
                ),
                CustomTextFieldWithTitle(
                  controller: _phoneController,
                  hintText: 'Enter Phone Number',
                  label: 'Phone Number',
                ),
                CustomTextFieldWithTitle(
                  controller: _loginController,
                  hintText: 'Enter Login',
                  label: 'Login',
                ),
                CustomTextFieldWithTitle(
                  controller: _passController,
                  hintText: 'Enter Password',
                  label: 'Password',
                ),
                _buildColumn(),
                CustomTextFieldWithTitle(
                  controller: _aadhaarController,
                  hintText: 'Enter Aadhaar Number',
                  label: 'Aadhaar Number',
                ),
                CustomTextFieldWithTitle(
                  controller: _emailController,
                  hintText: 'Enter Email ID',
                  label: 'Email Id',
                ),
                CustomTextFieldWithTitle(
                  controller: _addressController,
                  hintText: 'Enter Address',
                  label: 'Address Info',
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildButton("Submit"),
                    _buildButton("Clear"),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Implement view functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryButtonColor,
                    foregroundColor: AppColors.whiteColor,
                    minimumSize: const Size(double.infinity, 38),
                  ),
                  child: const Text('History'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          side: BorderSide(color: AppColors.primaryButtonColor),
          minimumSize: Size(displayWidth(context) / 2.3, 40),
          backgroundColor: AppColors.whiteColor),
      onPressed: () {},
      child: Text(text, style: TextStyle(color: AppColors.primaryButtonColor)),
    );
  }

  Widget _buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Role",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Container(
          height: 40,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGrey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            value: selectedRole,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.lightGrey,
            ),
            isExpanded: true,
            hint: Text("Role"),
            underline: SizedBox(),
            onChanged: (String? newValue) {
              setState(() {
                selectedRole = newValue;
              });
            },
            items: roles.map((String role) {
              return DropdownMenuItem<String>(
                value: role,
                child: Text(role),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 10),
        Text("Destination",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Destination",
                  hintStyle: TextStyle(color: AppColors.lightGrey),
                  border: OutlineInputBorder(),
                  constraints: BoxConstraints(maxHeight: 35),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Text("Active",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Transform.scale(
              scale: 0.7,
              child: Switch(
                value: isActive,
                inactiveThumbColor: AppColors.lightGrey,
                activeColor: AppColors.primaryButtonColor,
                onChanged: (bool value) {
                  setState(() {
                    isActive = value;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
