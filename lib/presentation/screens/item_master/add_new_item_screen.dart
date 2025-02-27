import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/config/common_texts.dart';
import 'package:retail_mobile/core/utils/barcode_scanner.dart';
import 'package:retail_mobile/core/utils/helper.dart';
import 'package:retail_mobile/presentation/widgets/common_image_widget.dart';
import 'package:retail_mobile/presentation/widgets/custom_dropdown.dart';
import 'package:retail_mobile/presentation/widgets/custom_svg.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class AddNewItemScreen extends StatefulWidget {
  const AddNewItemScreen({super.key});

  @override
  State<AddNewItemScreen> createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends State<AddNewItemScreen> {
  final TextEditingController barCodeController = TextEditingController();
  final TextEditingController shortNameController = TextEditingController();
  final TextEditingController longNameController = TextEditingController();
  final TextEditingController shortCodeController = TextEditingController();
  final TextEditingController retailPriceController = TextEditingController();
  final TextEditingController mrpController = TextEditingController();
  final TextEditingController wholeSaleController = TextEditingController();
  final TextEditingController purchasePriceController = TextEditingController();
  final TextEditingController minimumStockController = TextEditingController();
  final TextEditingController hsnCodeController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController incentiveController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController discountAmountController =
      TextEditingController();
  final TextEditingController uomConversationController =
      TextEditingController();
  final TextEditingController cgstRateController = TextEditingController();
  final TextEditingController sgstRateController = TextEditingController();
  final TextEditingController igstRateController = TextEditingController();
  final TextEditingController cessRateController = TextEditingController();
  final TextEditingController cessAmountController = TextEditingController();
  final TextEditingController additionalCessAmountController =
      TextEditingController();

  String? selectedUOM;
  File? _image;
  bool isActive = false;
  bool isFavorite = false;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

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
        title: Text("Add New Item",
            style: TextStyle(
                color: AppColors.primaryButtonColor,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () async {
              String? result = await BarcodeScannerScreen.scanBarcode(context);
              print(result);
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFFFE3E9),
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                margin: EdgeInsets.only(right: 16),
                child: Row(
                  children: [
                    CustomSvg(
                      name: 'scan',
                      height: 15,
                      width: 15,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Scan Code',
                      style: TextStyle(color: AppColors.primaryButtonColor),
                    )
                  ],
                )),
          )
        ],
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
                'Item Information',
                style: TextStyle(
                    color: AppColors.primaryButtonColor, fontSize: 15),
              ),
              CustomTextFieldWithTitle(
                controller: barCodeController,
                hintText: 'Enter Item Barcode',
                label: 'Item Barcode',
              ),
              CustomTextFieldWithTitle(
                controller: shortNameController,
                hintText: 'Enter Short Name',
                label: 'Short Name',
              ),
              CustomTextFieldWithTitle(
                controller: longNameController,
                hintText: 'Enter Item Long Name',
                label: 'Item Long Name',
              ),
              CustomTextFieldWithTitle(
                controller: shortCodeController,
                hintText: 'Enter Short Code',
                label: 'Short Code',
              ),
              _buildColumn('UOM', CommonTexts.uomUnits),
              _buildColumn('Brand', CommonTexts.uomUnits),
              _buildColumn('Dept', CommonTexts.uomUnits),
              _buildColumn('Category', CommonTexts.uomUnits),
              CustomTextFieldWithTitle(
                controller: retailPriceController,
                hintText: 'Enter Retail Price',
                label: 'Retail Price',
              ),
              CustomTextFieldWithTitle(
                controller: mrpController,
                hintText: 'Enter MRP',
                label: 'MRP',
              ),
              CustomTextFieldWithTitle(
                controller: wholeSaleController,
                hintText: 'Enter Whole Sale Price',
                label: 'Whole Sale Price',
              ),
              CustomTextFieldWithTitle(
                controller: purchasePriceController,
                hintText: 'Enter Purchase Price',
                label: 'Purchase Price',
              ),
              CustomTextFieldWithTitle(
                controller: minimumStockController,
                hintText: 'Enter Minimum Stock',
                label: 'Minimum Stock',
              ),
              CustomTextFieldWithTitle(
                controller: qtyController,
                hintText: 'Enter QTY',
                label: 'QTY',
              ),
              CustomTextFieldWithTitle(
                controller: hsnCodeController,
                hintText: 'Enter HSN Code',
                label: 'HSN Code',
              ),
              CustomTextFieldWithTitle(
                controller: discountController,
                hintText: 'Enter Discount %',
                label: 'Discount %',
              ),
              CustomTextFieldWithTitle(
                controller: discountAmountController,
                hintText: 'Enter Discount Amount',
                label: 'Discount Amount',
              ),
              CustomTextFieldWithTitle(
                controller: incentiveController,
                hintText: 'Enter Incentive Amount',
                label: 'Incentive Amount',
              ),
              SizedBox(height: 16),
              Text(
                'Bulk Break',
                style: TextStyle(
                    color: AppColors.primaryButtonColor, fontSize: 15),
              ),
              CustomDropdown(
                title: "UOM 2",
                dropdownItems: CommonTexts.uomUnits,
                selectedValue: selectedUOM,
                onChanged: (value) {
                  setState(() {
                    selectedUOM = value;
                  });
                },
              ),
              // _buildColumn('UOM 2', CommonTexts.uomUnits),
              CustomTextFieldWithTitle(
                controller: uomConversationController,
                hintText: 'Enter UOM Conversation',
                label: 'UOM Conversation',
              ),
              SizedBox(height: 16),
              Text(
                'GST Tax Rate',
                style: TextStyle(
                    color: AppColors.primaryButtonColor, fontSize: 15),
              ),
              CustomTextFieldWithTitle(
                controller: cgstRateController,
                hintText: 'Enter CGST Rate',
                label: 'CGST Rate',
              ),
              CustomTextFieldWithTitle(
                controller: sgstRateController,
                hintText: 'Enter SGST Rate',
                label: 'SGST Rate',
              ),
              CustomTextFieldWithTitle(
                controller: igstRateController,
                hintText: 'Enter IGST Rate',
                label: 'IGST Rate',
              ),
              CustomTextFieldWithTitle(
                controller: cessRateController,
                hintText: 'Enter Cess Rate',
                label: 'Cess Rate',
              ),
              CustomTextFieldWithTitle(
                controller: cessAmountController,
                hintText: 'Enter Cess Amount',
                label: 'Cess Amount',
              ),
              CustomTextFieldWithTitle(
                controller: additionalCessAmountController,
                hintText: 'Enter Additional Cess Amount',
                label: 'Additional Cess Amount',
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Image Upload',
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 10,
              ),
              DottedBorder(
                color: AppColors.primaryButtonColor,
                strokeWidth: 1.5,
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                dashPattern: const [8, 4],
                child: GestureDetector(
                  onTap: () {
                    _pickImage();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        _image != null
                            ? Image.file(
                                _image!,
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: CommonImageWidget(imageName: 'upload')),
                        const SizedBox(height: 10),
                        Text(
                          'Product Image',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.primaryButtonColor),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Text('Browse Files')),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Favourite",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Icon(
                        Icons.star_rounded,
                        color: isFavorite
                            ? Colors.amberAccent.shade400
                            : AppColors.greyColor,
                      )),
                ],
              ),
              Row(
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
              Text(
                "#UOM Conversion Eg: Bottle(BTL)=750 ML (MLT)",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primaryButtonColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton("Clear", false),
                  _buildButton("Submit", true),
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
            value: selectedUOM,
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
                  selectedUOM = newValue;
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
