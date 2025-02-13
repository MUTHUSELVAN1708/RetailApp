import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:retail_mobile/presentation/widgets/common_date_picker.dart';

class BusinessDatePicker extends StatefulWidget {
  const BusinessDatePicker({super.key});

  @override
  State createState() => _BusinessDatePickerState();
}

class _BusinessDatePickerState extends State<BusinessDatePicker> {
  DateTime? _selectedDate;

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
    return GestureDetector(
      onTap: () => _pickDate(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFCFCFCF)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Text(
              _selectedDate == null
                  ? 'Business Date'
                  : DateFormat('dd-MM-yyyy').format(_selectedDate!),
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.calendar_month,
              color: Color(0xFFCFCFCF),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
