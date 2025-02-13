import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:retail_mobile/config/app_colors.dart';

class DatePickerHelper {
  /// **Normal Date Picker**
  static Future<DateTime?> showDatePickerDialog(BuildContext context) async {
    DateTime today = DateTime.now();
    DateTime fiveYearsAgo = today.subtract(const Duration(days: 5 * 365));
    return await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: fiveYearsAgo,
      lastDate: today,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryButtonColor,
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryButtonColor,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
  }

  /// **OmniDateTime Picker**
  static Future<DateTime?> showOmniDatePicker(BuildContext context) async {
    DateTime today = DateTime.now();
    DateTime fiveYearsAgo = today.subtract(const Duration(days: 5 * 365));
    return await showDialog(
      context: context,
      builder: (context) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryButtonColor,
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryButtonColor,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: OmniDateTimePicker(
            initialDate: today,
            firstDate: fiveYearsAgo,
            lastDate: today,
            is24HourMode: false,
            isShowSeconds: false,
            minutesInterval: 1,
            secondsInterval: 1,
            isForce2Digits: true,
            onDateTimeChanged: (DateTime value) {},
          ),
        );
      },
    );
  }
}
