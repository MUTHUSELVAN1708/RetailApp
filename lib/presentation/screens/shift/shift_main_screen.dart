import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/screens/shift/business_date_picker.dart';
import 'package:retail_mobile/presentation/screens/shift/shift_list_screen.dart';
import 'package:retail_mobile/presentation/screens/shift/shift_start_screen.dart';
import 'package:retail_mobile/presentation/widgets/common_gesture_button.dart';

class ShiftMainScreen extends StatelessWidget {
  const ShiftMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ShiftScreen();
  }
}

class ShiftScreen extends StatelessWidget {
  const ShiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shift',
                style: TextStyle(
                    color: AppColors.primaryButtonColor, fontSize: 18),
              ),
              CommonGestureButton(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ShiftStartScreen();
                  }));
                },
                text: 'Start Shift',
                color: AppColors.primaryButtonColor,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BusinessDatePicker(),
              Expanded(
                  child: const SizedBox(
                width: 3,
              )),
              Text(
                'Shift No : ',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 12,
                width: 70,
                child: TextField(
                  cursorHeight: 14,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: '',
                    labelStyle: TextStyle(fontSize: 16),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black), // Underline color
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black), // Color when focused
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: AppColors.primaryButtonColor),
                ),
                // backgroundColor: Color(0xFFFFDEE4),
              ),
              child: Text(
                'View',
                style: TextStyle(
                    color: AppColors.primaryButtonColor, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ShiftListScreen(),
        ],
      ),
    );
  }
}
