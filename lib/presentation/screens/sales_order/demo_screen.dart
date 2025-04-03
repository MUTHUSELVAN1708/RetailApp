import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';
import 'package:retail_mobile/presentation/widgets/common_date_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class demoScreen extends StatefulWidget {
  const demoScreen({super.key});

  @override
  State<demoScreen> createState() => _demoScreenState();
}

class _demoScreenState extends State<demoScreen> {
  DateTime? _fromDate;
  DateTime? _toDate;

  Future<void> _pickDate(BuildContext context, bool isFrom) async {
    DateTime? dateTime = await DatePickerHelper.showDatePickerDialog(context,
        firstDate: isFrom ? null : _fromDate,
        initialDate: isFrom ? _fromDate : _toDate);
    if (dateTime != null) {
      setState(() {
        if (isFrom) {
          _fromDate = dateTime;
        } else {
          _toDate = dateTime;
        }
      });
    }
  }

  final List<Map<String, dynamic>> items = [
    {
      'supplierFirmName': 'Kit Kat',
      'itemName': '380',
      'purchasePrice': 'THD',
      'uom': '300',
    },
    {
      'supplierFirmName': 'Kit Kat',
      'itemName': '380',
      'purchasePrice': 'THD',
      'uom': '300',
    },
    {
      'supplierFirmName': 'Kit Kat',
      'itemName': '380',
      'purchasePrice': 'THD',
      'uom': '300',
    },
    {
      'supplierFirmName': 'Kit Kat',
      'itemName': '380',
      'purchasePrice': 'THD',
      'uom': '300',
    },
    {
      'supplierFirmName': 'Kit Kat',
      'itemName': '380',
      'purchasePrice': 'THD',
      'uom': '300',
    },
    {
      'supplierFirmName': 'Kit Kat',
      'itemName': '380',
      'purchasePrice': 'THD',
      'uom': '300',
    },
  ];

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
        title: Text(
          'Sales Order',
          style: TextStyle(
            color: AppColors.primaryButtonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
              width: 180,
              height: 25,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Customer Name (or) Phone Number",
                  hintStyle: TextStyle(color: AppColors.lightGrey),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Icon(
                      Icons.search,
                      color: AppColors.primaryButtonColor,
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(minWidth: 25),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  constraints: const BoxConstraints(maxHeight: 35),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16, bottom: 16, top: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    _pickDate(context, true);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFFCFCFCF))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _fromDate == null
                              ? 'From Date'
                              : DateFormat('dd-MM-yyyy').format(_fromDate!),
                          style: TextStyle(
                              color: _fromDate == null
                                  ? Color(0xFFCFCFCF)
                                  : AppColors.secondaryColor),
                        ),
                        Icon(
                          Icons.calendar_month_rounded,
                          color: Color(0xFFCFCFCF),
                          size: 18,
                        )
                      ],
                    ),
                  ),
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    if (_fromDate != null) {
                      _pickDate(context, false);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFFCFCFCF))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _toDate == null
                              ? 'To Date'
                              : DateFormat('dd-MM-yyyy').format(_toDate!),
                          style: TextStyle(
                              color: _toDate == null
                                  ? Color(0xFFCFCFCF)
                                  : AppColors.secondaryColor),
                        ),
                        Icon(
                          Icons.calendar_month_rounded,
                          color: Color(0xFFCFCFCF),
                          size: 18,
                        )
                      ],
                    ),
                  ),
                )),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primaryButtonColor),
                    child: Icon(
                      Icons.search,
                      color: AppColors.whiteColor,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primaryButtonColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'View',
                    style: TextStyle(
                      color: AppColors.primaryButtonColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
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
                        margin:
                            EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 12, top: 12, bottom: 12, right: 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildRow(
                                'Supplier Firm Name',
                                items[index]['supplierFirmName'] ?? '',
                              ),
                              _buildRow(
                                'Item Name',
                                items[index]['itemName'] ?? '',
                              ),
                              _buildRow(
                                'Purchase Price',
                                items[index]['purchasePrice'] ?? '',
                              ),
                              _buildRow(
                                'UOM',
                                items[index]['uom'] ?? '',
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_circle_outline_outlined,
                    color: Colors.white),
                label: const Text('Add',
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryButtonColor,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
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
