import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class AddSupplierDetailsScreen extends StatefulWidget {
  const AddSupplierDetailsScreen({super.key});

  @override
  State<AddSupplierDetailsScreen> createState() =>
      AddSupplierDetailsScreenState();
}

class AddSupplierDetailsScreenState extends State<AddSupplierDetailsScreen> {
  final supplierFirmNameController = TextEditingController();
  final gstinController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  bool isActive = false;

  @override
  void dispose() {
    supplierFirmNameController.dispose();
    gstinController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void _clearForm() {
    setState(() {
      supplierFirmNameController.clear();
      gstinController.clear();
      phoneController.clear();
      emailController.clear();
      addressController.clear();
      isActive = false;
    });
  }

  void addSupplier() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Form saved and printed')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryButtonColor,
            )),
        title: Text('Add Supplier',
            style: TextStyle(color: AppColors.primaryButtonColor)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.red),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Supplier Information',
                style: TextStyle(
                    color: AppColors.primaryButtonColor, fontSize: 15),
              ),
              const SizedBox(height: 10),
              CustomTextFieldWithTitle(
                label: 'Supplier Firm Name',
                hintText: 'Enter Supplier Firm Name',
                controller: supplierFirmNameController,
              ),
              CustomTextFieldWithTitle(
                label: 'GSTIN',
                hintText: 'Enter GSTIN',
                controller: gstinController,
              ),
              CustomTextFieldWithTitle(
                label: 'Phone',
                hintText: 'Enter Phone',
                controller: phoneController,
              ),
              CustomTextFieldWithTitle(
                label: 'Email Id',
                hintText: 'Enter Email Id',
                controller: emailController,
                inputType: TextInputType.number,
              ),
              CustomTextFieldWithTitle(
                label: 'Address',
                hintText: 'Enter Address',
                controller: addressController,
                inputType: TextInputType.number,
              ),
              Row(
                children: [
                  Text(
                    'Active',
                    style: TextStyle(fontSize: 15),
                  ),
                  Transform.scale(
                    scale: 0.6,
                    child: Switch(
                      activeColor: AppColors.primaryButtonColor,
                      inactiveThumbColor: AppColors.veryLightGrey,
                      value: isActive,
                      onChanged: (value) {
                        setState(() {
                          isActive = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: addSupplier,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryButtonColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle_outline_outlined,
                            color: AppColors.whiteColor,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('Add',
                              style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _clearForm,
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: AppColors.primaryButtonColor),
                      ),
                      child: Text(
                        'Clear',
                        style: TextStyle(
                            color: AppColors.veryLightBlackColor, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
