import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/custom_button2.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class UpdatePriceStock extends StatefulWidget {
  const UpdatePriceStock({super.key});

  @override
  State<UpdatePriceStock> createState() => _UpdatePriceStockState();
}

class _UpdatePriceStockState extends State<UpdatePriceStock> {
  final _mrpController = TextEditingController();
  final _itemNameController = TextEditingController();
  bool isReduceStock = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryButtonColor,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Update Price And Stock',
          style: TextStyle(color: AppColors.primaryButtonColor),
        ),
        titleSpacing: -15,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16, bottom: 16, top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFieldWithTitle(
                controller: _itemNameController,
                hintText: 'Enter Item Name',
                label: 'Item Name',
              ),
              CustomTextFieldWithTitle(
                controller: _mrpController,
                hintText: 'Enter Existing Stock',
                label: 'Existing Stock',
              ),
              CustomTextFieldWithTitle(
                controller: _itemNameController,
                hintText: 'Enter New Stock',
                label: 'New Stock',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isReduceStock = !isReduceStock;
                        });
                      },
                      child: Icon(
                        isReduceStock
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: isReduceStock
                            ? AppColors.primaryButtonColor
                            : AppColors.lightGrey,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Reduce Stock',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              CustomTextFieldWithTitle(
                controller: _itemNameController,
                hintText: 'Enter MRP',
                label: 'MRP',
              ),
              CustomTextFieldWithTitle(
                controller: _itemNameController,
                hintText: 'Enter Retail Price',
                label: 'Retail Price',
              ),
              CustomTextFieldWithTitle(
                controller: _itemNameController,
                hintText: 'Enter Whole Price',
                label: 'Whole Price',
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton2(
                    text: 'Clear',
                    isColor: false,
                    onPressed: () {},
                  ),
                  CustomButton2(
                    text: 'Update',
                    isColor: true,
                    onPressed: () {},
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
