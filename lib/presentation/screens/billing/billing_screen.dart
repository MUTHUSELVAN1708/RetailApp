import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/core/utils/helper.dart';
import 'package:retail_mobile/presentation/screens/billing/product_card.dart';

import 'barcode_scanner.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      'Fav',
      'All',
      'Chocolate',
      'Fruits',
      'Vegetables',
      'Chocolate',
      'Fruits',
      'Vegetables'
    ];
    List<String> categories = [
      'star',
      'all',
      'chocolate',
      'fruits',
      'veg',
      'chocolate',
      'fruits',
      'veg'
    ];

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: 110,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(10),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return _buildCategoryItem(
                      categories[index], labels[index], () {}, index == 0);
                },
              )),
          BarcodeScanner(
            isCart: false,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ProductCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(
      String icon, String label, void Function() onTap, bool isActive) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey[200],
                      child: Image.asset('assets/images/$icon.png'),
                    ),
                    const SizedBox(height: 8),
                    Text(label),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: isActive ? -3 : 0,
            child: Container(
              height: isActive ? 8 : 2,
              width: displayWidth(context),
              decoration: BoxDecoration(
                color: AppColors.primaryButtonColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
