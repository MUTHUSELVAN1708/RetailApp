import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart' show AppColors;
import 'package:retail_mobile/config/common_texts.dart';
import 'package:retail_mobile/core/utils/helper.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class AddNewCustomerScreen extends StatefulWidget {
  const AddNewCustomerScreen({super.key});

  @override
  State<AddNewCustomerScreen> createState() => _AddNewCustomerScreenState();
}

class _AddNewCustomerScreenState extends State<AddNewCustomerScreen> {
  bool isActive = false;
  String? selectedState;
  final gstinController = TextEditingController();
  final customerNameController = TextEditingController();
  final phoneNoController = TextEditingController();
  final alternateNumberController = TextEditingController();
  final emailIdController = TextEditingController();
  final rewardPointsController = TextEditingController();
  final addressController = TextEditingController();
  final pinCodeController = TextEditingController();
  final creditAmountController = TextEditingController();
  final creditLimitController = TextEditingController();
  final openingBalanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon:
                Icon(Icons.arrow_back_ios, color: AppColors.primaryButtonColor),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text("Add New Customer",
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
              Text(
                'Personal Info',
                style: TextStyle(
                    color: AppColors.primaryButtonColor, fontSize: 15),
              ),
              CustomTextFieldWithTitle(
                controller: gstinController,
                hintText: 'Enter GSTIN',
                label: 'GSTIN',
              ),
              CustomTextFieldWithTitle(
                controller: customerNameController,
                hintText: 'Enter Customer Name',
                label: 'Customer Name',
              ),
              CustomTextFieldWithTitle(
                controller: phoneNoController,
                hintText: 'Enter Phone No',
                label: 'Phone No',
              ),
              CustomTextFieldWithTitle(
                controller: alternateNumberController,
                hintText: 'Enter Alternate Number',
                label: 'Alternate Number',
              ),
              CustomTextFieldWithTitle(
                controller: emailIdController,
                hintText: 'Enter Email Id',
                label: 'Email Id',
              ),
              CustomTextFieldWithTitle(
                controller: rewardPointsController,
                hintText: 'Enter Reward Points',
                label: 'Reward Points',
              ),
              CustomTextFieldWithTitle(
                controller: addressController,
                hintText: 'Enter Address',
                label: 'Address',
              ),
              _buildColumn('State', CommonTexts.tamilNaduDistricts),
              CustomTextFieldWithTitle(
                controller: pinCodeController,
                hintText: 'Enter PinCode',
                label: 'PinCode',
              ),
              CustomTextFieldWithTitle(
                controller: creditAmountController,
                hintText: 'Enter Credit Amount',
                label: 'Credit Amount',
              ),
              CustomTextFieldWithTitle(
                controller: creditLimitController,
                hintText: 'Enter Credit Limit',
                label: 'Credit Limit',
              ),
              CustomTextFieldWithTitle(
                controller: openingBalanceController,
                hintText: 'Enter Opening Balance',
                label: 'Opening Balance',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Active",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
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
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton("Clear", false),
                  _buildButton("Save", true),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildButton(String text, bool isSubmit) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          side: BorderSide(color: AppColors.primaryButtonColor),
          minimumSize: Size(displayWidth(context) / 2.3, 40),
          backgroundColor:
              isSubmit ? AppColors.primaryButtonColor : AppColors.whiteColor),
      onPressed: () {},
      child: Text(text,
          style: TextStyle(
              color: isSubmit
                  ? AppColors.whiteColor
                  : AppColors.primaryButtonColor)),
    );
  }

  Widget _buildColumn(String title, List<String> dropdowns) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        Text(title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 7),
        Container(
          height: 38,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGrey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            value: selectedState,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.lightGrey,
            ),
            borderRadius: BorderRadius.circular(10),
            dropdownColor: Color(0xFFFFEDF0),
            isExpanded: true,
            hint: Text(
              title,
              style: TextStyle(color: AppColors.lightGrey),
            ),
            underline: SizedBox(),
            onChanged: (String? newValue) {
              setState(() {
                if (newValue != null) {
                  selectedState = newValue;
                }
              });
            },
            items: dropdowns.map((String list) {
              return DropdownMenuItem<String>(
                value: list,
                child: Text(
                  list,
                  style: TextStyle(color: Color(0xFFB64D61)),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
