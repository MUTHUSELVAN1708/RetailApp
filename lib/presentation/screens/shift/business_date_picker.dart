import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BusinessDatePicker extends StatefulWidget {
  const BusinessDatePicker({super.key});

  @override
  State createState() => _BusinessDatePickerState();
}

class _BusinessDatePickerState extends State<BusinessDatePicker> {
  DateTime? _selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
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
          GestureDetector(
            onTap: () => _pickDate(context),
            child: Icon(
              Icons.calendar_month,
              color: Color(0xFFCFCFCF),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
