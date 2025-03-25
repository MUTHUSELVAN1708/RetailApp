import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/common_date_picker.dart'
    show DatePickerHelper;
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class ReprintPaymentReceiptScreen extends StatefulWidget {
  const ReprintPaymentReceiptScreen({super.key});

  @override
  State<ReprintPaymentReceiptScreen> createState() =>
      ReprintPaymentReceiptScreenState();
}

class ReprintPaymentReceiptScreenState
    extends State<ReprintPaymentReceiptScreen> {
  String _formType = 'Payment';
  final TextEditingController _numberController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context) async {
    DateTime? dateTime = await DatePickerHelper.showDatePickerDialog(context);
    if (dateTime != null) {
      setState(() {
        _selectedDate = dateTime;
      });
    }
  }

  void _reprint() {
    // Reprint logic would go here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Form reprinted')),
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
        title: Text("RePrint Payment / Receipt",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _formType = 'Payment';
                            });
                          },
                          child: Icon(
                            _formType == 'Payment'
                                ? Icons.check_circle_rounded
                                : Icons.circle_outlined,
                            color: AppColors.primaryButtonColor,
                            size: 20,
                          )),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text('Payment', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              _formType = 'Receipt';
                            });
                          },
                          child: Icon(
                            _formType == 'Receipt'
                                ? Icons.check_circle_rounded
                                : Icons.circle_outlined,
                            color: AppColors.primaryButtonColor,
                            size: 20,
                          )),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text('Receipt', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextFieldWithTitle(
                label: 'Payment / Receipt No',
                hintText: 'Enter Payment / Receipt No',
                controller: _numberController,
              ),
              const SizedBox(height: 5),
              Text(
                'Invoice Date',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () => _pickDate(context),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.lightGrey)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'Select Date'
                            : DateFormat('dd-MM-yyyy').format(_selectedDate!),
                        style: TextStyle(
                            color: _selectedDate == null
                                ? AppColors.lightGrey
                                : Colors.black,
                            fontSize: 15),
                      ),
                      Icon(
                        Icons.calendar_month,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _reprint,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryButtonColor,
                      ),
                      child: const Text(
                        'RePrint',
                        style: TextStyle(fontSize: 15),
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
