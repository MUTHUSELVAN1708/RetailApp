import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/common_date_picker.dart';

class ExchangeBillGeneration extends StatefulWidget {
  const ExchangeBillGeneration({super.key});

  @override
  State<ExchangeBillGeneration> createState() => _ExchangeBillGenerationState();
}

class _ExchangeBillGenerationState extends State<ExchangeBillGeneration> {
  final TextEditingController _billNumberController = TextEditingController();
  final TextEditingController _billDateController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    DateTime? dateTime = await DatePickerHelper.showDatePickerDialog(context);
    if (dateTime != null) {
      setState(() {
        _selectedDate = dateTime;
      });
    }
  }

  final List<Map<String, dynamic>> items = [
    {
      'itemName': 'Item Name',
      'coupon': '120',
      'ret_qty': '3.00',
      'ref_qty': '3.00',
      'qty2': '3.00',
      'qty1': '3.00',
      'manual_qty': '3.00',
      'raw_item': '3.00'
    },
    {
      'itemName': 'Item Name',
      'coupon': '120',
      'ret_qty': '3.00',
      'ref_qty': '3.00',
      'qty2': '3.00',
      'qty1': '3.00',
      'manual_qty': '3.00',
      'raw_item': '3.00'
    },
    {
      'itemName': 'Item Name',
      'coupon': '120',
      'ret_qty': '3.00',
      'ref_qty': '3.00',
      'qty2': '3.00',
      'qty1': '3.00',
      'manual_qty': '3.00',
      'raw_item': '3.00'
    },
    {
      'itemName': 'Item Name',
      'coupon': '120',
      'ret_qty': '3.00',
      'ref_qty': '3.00',
      'qty2': '3.00',
      'qty1': '3.00',
      'manual_qty': '3.00',
      'raw_item': '3.00'
    },
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        _billDateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryButtonColor,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Exchange Bill Generation',
          style: TextStyle(color: AppColors.primaryButtonColor),
        ),
        titleSpacing: -10,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Enter Return Bill Number'),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: _billNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Enter Bill Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        hintStyle: TextStyle(color: Color(0xFFCFCFCF)),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        constraints: BoxConstraints(maxHeight: 35)),
                  ),
                  const SizedBox(height: 16),
                  const Text('Return Bill Date'),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () => _pickDate(context),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.lightGreyColor)),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedDate == null
                                ? 'Bill Date'
                                : DateFormat('dd-MM-yyyy').format(_selectedDate!),
                            style: TextStyle(
                                color: _selectedDate == null
                                    ? AppColors.lightGreyColor
                                    : AppColors.blackColor),
                          ),
                          Icon(
                            Icons.calendar_month_rounded,
                            size: 20,
                            color: AppColors.lightGreyColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryButtonColor,
                      minimumSize: const Size(double.infinity, 40),
                    ),
                    child: const Text(
                      'View',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 12, top: 12, bottom: 12, right: 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildRow(
                              'Item Name',
                              items[index]['itemName'] ?? '',
                            ),
                            _buildRow(
                              'Rate',
                              items[index]['coupon'] ?? '',
                            ),
                            _buildRow(
                              'RET. Qty',
                              items[index]['ret_qty'] ?? '',
                            ),
                            _buildRow(
                              'REF. Qty',
                              items[index]['ref_qty'] ?? '',
                            ),
                            _buildRow(
                              '+Qty',
                              items[index]['qty2'] ?? '',
                            ),
                            _buildRow(
                              '-Qty',
                              items[index]['qty1'] ?? '',
                            ),
                            _buildRow(
                              'Enter Manual Qty',
                              items[index]['manual_qty'] ?? '',
                            ),
                            _buildRow(
                              'RAW Item',
                              items[index]['raw_item'] ?? '',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 10,
                        right: 20,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 10,
                              width: 30,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.edit,
                                  color: AppColors.primaryButtonColor,
                                  size: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                              width: 30,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete_forever,
                                  color: AppColors.primaryButtonColor,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                );
              },
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 5),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement clear functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.whiteColor,
                      side:
                          const BorderSide(color: AppColors.primaryButtonColor),
                    ),
                    child: const Text('Clear',
                        style: TextStyle(color: AppColors.primaryButtonColor)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.whiteColor,
                      side:
                          const BorderSide(color: AppColors.primaryButtonColor),
                    ),
                    child: const Text('Cancel',
                        style: TextStyle(color: AppColors.primaryButtonColor)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryButtonColor,
                minimumSize: const Size(double.infinity, 40),
              ),
              child: const Text(
                'Continue Printing/Payment',
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          // Label section with fixed width
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // Colon
          const SizedBox(width: 8),
          const Text(
            ':',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          // Value
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
