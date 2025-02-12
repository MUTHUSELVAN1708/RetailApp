import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';

class BillListScreen extends StatelessWidget {
  final List<Map<String, String>> billList = [
    {
      'Name': 'Garlic',
      'HSN': 'HSN1232',
      'Rate': '220',
      'Discount': '20',
      'Amount': '\$200',
    },
    {
      'Name': 'Ghee',
      'HSN': 'HSN1232',
      'Rate': '220',
      'Discount': '20',
      'Amount': '\$200',
    },
    {
      'Name': 'Coconut',
      'HSN': 'HSN1232',
      'Rate': '220',
      'Discount': '20',
      'Amount': '\$200',
    },
    {
      'Name': 'Vathal',
      'HSN': 'HSN1232',
      'Rate': '220',
      'Discount': '20',
      'Amount': '\$200',
    },
    {
      'Name': 'Seeragam',
      'HSN': 'HSN1232',
      'Rate': '220',
      'Discount': '20',
      'Amount': '\$200',
    },
  ];

  BillListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: billList.length,
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
                    ...billList[index].entries.map((entry) {
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
    );
  }
}
