import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/common_date_picker.dart';
import 'package:retail_mobile/presentation/widgets/custom_dropdown.dart';
import 'package:retail_mobile/config/common_texts.dart';
import 'package:intl/intl.dart';

class OtherReportSupplierDetailedScreen extends StatefulWidget {
  const OtherReportSupplierDetailedScreen({super.key});

  @override
  State<OtherReportSupplierDetailedScreen> createState() =>
      _OtherReportSupplierDetailedScreenState();
}

class _OtherReportSupplierDetailedScreenState
    extends State<OtherReportSupplierDetailedScreen> {
  String? selectedRole;

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
      'Invoice No': '1',
      'Invoice Date': 'Admin',
      'Bill Amount': '400',
      'Payment Status': 'prtially paid',
      'Amount Paid': '400.00',
      'Due Amount': '400.0',
      'Payment Date': 'sep 8,2025',
      'Payment Mode': 'Card payment',
      'Remarks': '400.0',
    },
    {
      'Invoice No': '1',
      'Invoice Date': 'Admin',
      'Bill Amount': '400',
      'Payment Status': 'prtially paid',
      'Amount Paid': '400.00',
      'Due Amount': '400.0',
      'Payment Date': 'sep 8,2025',
      'Payment Mode': 'Card payment',
      'Remarks': '400.0',
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
          'Report',
          style: TextStyle(
            color: AppColors.primaryButtonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16, bottom: 16, top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 10),

              CustomDropdown(
                  title: 'Select',
                  dropdownItems: CommonTexts.customerDetailReport,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRole = newValue;
                    });
                  }),
              CustomDropdown(
                  title: 'Select Supplier',
                  dropdownItems: CommonTexts.customerDetailReport,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRole = newValue;
                    });
                  }),

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
              SizedBox(
                height: 300, // Adjust as needed
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
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "S.No",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primaryButtonColor,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          items[index]['S.No'] ?? '',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Name",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primaryButtonColor,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          items[index]['Name'] ?? '',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                _buildRow(
                                  'Bill Amount',
                                  items[index]['Bill Amount'] ?? '',
                                ),
                                _buildRow(
                                  'Payment Status',
                                  items[index]['Payment Status'] ?? '',
                                ),
                                _buildRow(
                                  'Amount Paid',
                                  items[index]['Amount Paid'] ?? '',
                                ),
                                _buildRow(
                                  'Due Amount',
                                  items[index]['Due Amount'] ?? '',
                                ),
                                _buildRow(
                                  'Payment Date',
                                  items[index]['Payment Date'] ?? '',
                                ),
                                _buildRow(
                                  'Payment Mode',
                                  items[index]['Payment Mode'] ?? '',
                                ),
                                _buildRow(
                                  'Remarks',
                                  items[index]['Remarks'] ?? '',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: AppColors.primaryButtonColor),
                      ),
                      child: Text(
                        'Share',
                        style: TextStyle(
                          color: AppColors.primaryButtonColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: AppColors.primaryButtonColor),
                      ),
                      child: const Text(
                        'Export',
                        style: TextStyle(
                          color: AppColors.primaryButtonColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Print Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    // Handle Print Action
                  },
                  child: Text(
                    "Print",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
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
            width: 150,
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

  Widget _buildRow1(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14, color: Color(0xFF4D4D4D)),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
