import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/core/utils/animation.dart';
import 'package:retail_mobile/presentation/screens/cart/bill_list_screen.dart';
import 'package:retail_mobile/presentation/screens/cart/cart_total_amount_card.dart';
import 'package:retail_mobile/presentation/screens/cart/expandable_arrow_menu.dart';
import 'package:retail_mobile/presentation/widgets/common_date_picker.dart';

class ViewBillScreen extends ConsumerStatefulWidget {
  const ViewBillScreen({super.key});

  @override
  ConsumerState<ViewBillScreen> createState() => _ViewBillScreenState();
}

class _ViewBillScreenState extends ConsumerState<ViewBillScreen>
    with SingleTickerProviderStateMixin {
  DateTime? _selectedDate;
  late AppAnimation appAnimation;

  @override
  void initState() {
    super.initState();
    appAnimation = AppAnimation(vsync: this);
    appAnimation.controller.forward();
  }

  // @override
  // void dispose() {
  //   appAnimation.dispose();
  //   super.dispose();
  // }

  Future<void> _pickDate(BuildContext context) async {
    DateTime? dateTime = await DatePickerHelper.showDatePickerDialog(context);
    if (dateTime != null) {
      setState(() {
        _selectedDate = dateTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: AppColors.primaryButtonColor,
                                  size: 22,
                                ),
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'View Bill',
                                style: TextStyle(
                                  color: AppColors.primaryButtonColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          _buildTextField('Bill Number'),
                          _buildTextField('Bill Date',
                              icon: Icons.calendar_month_rounded),
                          _buildTextField('Customer Name',
                              initialValue: 'Will Jacks'),
                          _buildTextField('Phone No',
                              initialValue: '8906573410', enabled: true),
                          _buildTextField('Customer GSTIN',
                              initialValue: '8906573410', enabled: true),
                          const SizedBox(height: 10),
                          SizedBox(height: 250, child: BillListScreen()),
                          const SizedBox(height: 10),
                          CartTotalAmountCard(
                            isViewBill: true,
                            controller: appAnimation.controller,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ExpandableArrowMenu(
              animation: appAnimation.animation,
              horizontalMargin: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label,
      {String? initialValue, IconData? icon, bool enabled = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5),
        SizedBox(
          height: 30,
          child: label == 'Bill Date'
              ? GestureDetector(
                  onTap: () => _pickDate(context),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedDate == null
                              ? label
                              : DateFormat('dd-MM-yyyy').format(_selectedDate!),
                        ),
                        Icon(
                          icon,
                          size: 15,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                )
              : TextField(
                  cursorHeight: 15,
                  decoration: InputDecoration(
                    hintText: 'Enter $label',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey), // Light grey border
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  ),
                  controller: initialValue != null
                      ? TextEditingController(text: initialValue)
                      : null,
                  enabled: enabled,
                ),
        ),
      ],
    );
  }
}
