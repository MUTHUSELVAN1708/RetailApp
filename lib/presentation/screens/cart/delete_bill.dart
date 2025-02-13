import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/common_date_picker.dart';

class DeleteBillDialog extends StatefulWidget {
  const DeleteBillDialog({super.key});

  @override
  State<DeleteBillDialog> createState() => _DeleteBillDialogState();
}

class _DeleteBillDialogState extends State<DeleteBillDialog> {
  final TextEditingController _billNumberController = TextEditingController();
  final TextEditingController _billNumberToController = TextEditingController();
  final TextEditingController _billDateController = TextEditingController();
  bool _deleteMultiple = false;

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
  void dispose() {
    _billNumberController.dispose();
    _billNumberToController.dispose();
    _billDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryButtonColor,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Delete Bill',
          style: TextStyle(fontSize: 16, color: AppColors.primaryButtonColor),
        ),
        titleSpacing: -10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Bill Number${_deleteMultiple ? ' From' : ''}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _billNumberController,
              decoration: InputDecoration(
                hintText: 'Key Id',
                hintStyle: TextStyle(color: Color(0xFFCFCFCF)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                constraints: BoxConstraints(maxHeight: 35),
              ),
            ),
            const SizedBox(height: 16),
            if (_deleteMultiple) ...[
              const Text(
                'Bill Number To',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _billNumberToController,
                decoration: InputDecoration(
                  constraints: BoxConstraints(maxHeight: 35),
                  hintText: 'Key Id',
                  hintStyle: TextStyle(color: Color(0xFFCFCFCF)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
            const Text(
              'Select Bill Date',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _pickDate(context),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFCFCFCF))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'Bill Date'
                          : DateFormat('dd-MM-yyyy').format(_selectedDate!),
                      style: TextStyle(
                          color: _selectedDate == null
                              ? Color(0xFFCFCFCF)
                              : AppColors.blackColor),
                    ),
                    Icon(
                      Icons.calendar_month_rounded,
                      size: 20,
                      color: Color(0xFFCFCFCF),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      checkboxTheme: CheckboxThemeData(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(50), // Makes it round
                        ),
                      ),
                    ),
                    child: Checkbox(
                      value: _deleteMultiple,
                      onChanged: (value) {
                        setState(() {
                          _deleteMultiple = value ?? false;
                          if (!_deleteMultiple) {
                            _billNumberToController.clear();
                          }
                        });
                      },
                      activeColor: AppColors.primaryButtonColor,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Delete multiple bills',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryButtonColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text('Delete'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryButtonColor,
                      side: const BorderSide(
                        color: AppColors.primaryButtonColor,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
