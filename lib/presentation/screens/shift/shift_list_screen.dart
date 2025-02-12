import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';

class ShiftListScreen extends StatelessWidget {
  final List<Map<String, String>> shiftData = [
    {
      'Shift No': '101',
      'User Name': 'John Doe',
      'Start Time': '08:00 AM',
      'End Time': '04:00 PM',
      'Opening Balance': '\$1000',
      'Closing Balance': '\$1200',
    },
    {
      'Shift No': '102',
      'User Name': 'Jane Smith',
      'Start Time': '04:00 PM',
      'End Time': '12:00 AM',
      'Opening Balance': '\$1200',
      'Closing Balance': '\$1500',
    },
    {
      'Shift No': '102',
      'User Name': 'Jane Smith',
      'Start Time': '04:00 PM',
      'End Time': '12:00 AM',
      'Opening Balance': '\$1200',
      'Closing Balance': '\$1500',
    },
    {
      'Shift No': '102',
      'User Name': 'Jane Smith',
      'Start Time': '04:00 PM',
      'End Time': '12:00 AM',
      'Opening Balance': '\$1200',
      'Closing Balance': '\$1500',
    },
    {
      'Shift No': '102',
      'User Name': 'Jane Smith',
      'Start Time': '04:00 PM',
      'End Time': '12:00 AM',
      'Opening Balance': '\$1200',
      'Closing Balance': '\$1500',
    },
  ];

  ShiftListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: shiftData.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            margin: EdgeInsets.only(bottom: 10),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...shiftData[index].entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            "${entry.key}: ${entry.value}",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF333333)),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 10,
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
            ),
          );
        },
      ),
    );
  }
}
