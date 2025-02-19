import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/common_date_picker.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class CustomerPassbook extends StatefulWidget {
  const CustomerPassbook({super.key});

  @override
  State<CustomerPassbook> createState() => _CustomerPassbookState();
}

class _CustomerPassbookState extends State<CustomerPassbook> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  DateTime? _fromDate;
  DateTime? _toDate;

  final List<Map<String, dynamic>> items = [
    {
      'date': '23.06.2025',
      'description': 'Opening Balance',
      'debit': '1324.97',
      'credit': '6000.00',
      'available': '5000.00',
    },
    {
      'date': '23.06.2025',
      'description': 'Opening Balance',
      'debit': '1324.97',
      'credit': '6000.00',
      'available': '5000.00',
    },
    {
      'date': '23.06.2025',
      'description': 'Opening Balance',
      'debit': '1324.97',
      'credit': '6000.00',
      'available': '5000.00',
    },
    {
      'date': '23.06.2025',
      'description': 'Opening Balance',
      'debit': '1324.97',
      'credit': '6000.00',
      'available': '5000.00',
    },
    {
      'date': '23.06.2025',
      'description': 'Opening Balance',
      'debit': '1324.97',
      'credit': '6000.00',
      'available': '5000.00',
    },
  ];

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
        title: Text("Customer Passbook",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFieldWithTitle(
                controller: _nameController,
                hintText: 'Enter Customer Name',
                label: 'Customer Name',
              ),
              CustomTextFieldWithTitle(
                controller: _phoneController,
                hintText: 'Enter Phone Number',
                label: 'Phone Number',
              ),
              const SizedBox(height: 10),
              _buildDateRange(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Implement view functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryButtonColor,
                  foregroundColor: AppColors.whiteColor,
                  minimumSize: const Size(double.infinity, 38),
                ),
                child: const Text('View'),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
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
                                left: 12, top: 12, bottom: 12, right: 80),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildRow(
                                  'Date',
                                  items[index]['date'] ?? '',
                                ),
                                _buildRow(
                                  'Description',
                                  items[index]['description'] ?? '',
                                ),
                                _buildRow(
                                  'Debit Amount',
                                  items[index]['debit'] ?? '',
                                ),
                                _buildRow(
                                  'Credit Amount',
                                  items[index]['credit'] ?? '',
                                ),
                                _buildRow(
                                  'Available Balance',
                                  items[index]['available'] ?? '',
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
                            )),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateRange() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Search Date',
          style: TextStyle(fontSize: 15, color: AppColors.blackColor),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                (context, true);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
      ],
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
