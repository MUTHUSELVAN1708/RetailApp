import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/screens/report/cloud_report/cloud_activity_report.dart';
import 'package:retail_mobile/presentation/screens/report/inventory_report/inventory_report.dart';
import 'package:retail_mobile/presentation/screens/report/other_report/other_report.dart';
import 'package:retail_mobile/presentation/screens/report/sales_report/sales_report.dart';
import 'package:retail_mobile/presentation/widgets/common_date_picker.dart';
import 'package:retail_mobile/presentation/widgets/custom_dropdown.dart';
import 'package:retail_mobile/config/common_texts.dart';
import 'package:intl/intl.dart';

class HomeReportScreen extends StatefulWidget {
  const HomeReportScreen({super.key});

  @override
  State<HomeReportScreen> createState() => _HomeReportScreenState();
}

class _HomeReportScreenState extends State<HomeReportScreen> {
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

  String selectedReport = "Sales Report"; // Default selection

  void _selectReport(BuildContext context, String report) {
    setState(() {
      selectedReport = report;
    });

    // Navigate to the selected report screen
    Widget reportScreen;
    switch (report) {
      case "Sales Report":
        reportScreen = SalesReportScreen();
        break;
      case "Inventory Report":
        reportScreen = InventoryReportScreen();
        break;
      case "Other Report":
        reportScreen = OtherReportScreen();
        break;
      case "Cloud Activity Monitor":
        reportScreen = CloudActivityReportScreen();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => reportScreen),
    );
  }

  Widget _buildReportButton(
      BuildContext context, String text, bool isSelected) {
    return ElevatedButton(
      onPressed: () {
        _selectReport(context, text); // Navigate to the respective report
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Color(0xFF9E122C) : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Colors.black,
        shape: StadiumBorder(), // Makes the button oval-shaped
        padding: EdgeInsets.symmetric(
            horizontal: 24, vertical: 14), // Adjust padding
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
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
        title: Text(
          'select report',
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
              SingleChildScrollView(
                scrollDirection:
                    Axis.horizontal, // Set scrollDirection to horizontal
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildReportButton(context, "Sales Report",
                        selectedReport == "Sales Report"),
                    SizedBox(width: 10),
                    _buildReportButton(context, "Inventory Report",
                        selectedReport == "Inventory Report"),
                    SizedBox(width: 10),
                    _buildReportButton(context, "Other Report",
                        selectedReport == "Other Report"),
                    SizedBox(width: 10),
                    _buildReportButton(context, "Cloud Activity Monitor",
                        selectedReport == "Cloud Activity Monitor"),
                    SizedBox(width: 10),
                  ],
                ),
              ),
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
                  title: 'Role List',
                  dropdownItems: CommonTexts.salesReport,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRole = newValue;
                    });
                  }),
              const SizedBox(height: 380),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: AppColors.primaryButtonColor),
                      ),
                      child: Text(
                        'Print',
                        style: TextStyle(
                            color: AppColors.veryLightBlackColor, fontSize: 15),
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
                            color: AppColors.veryLightBlackColor, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryButtonColor,
                      ),
                      child: const Text(
                        'Share',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryButtonColor,
                      ),
                      child: const Text(
                        'View',
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
