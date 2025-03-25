import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/core/utils/helper.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class LinkItemsScreen extends StatefulWidget {
  const LinkItemsScreen({super.key});

  @override
  State<LinkItemsScreen> createState() => LinkItemsScreenState();
}

class LinkItemsScreenState extends State<LinkItemsScreen> {
  final gstinController = TextEditingController();
  final addressController = TextEditingController();
  String selectedFilter = "All";
  final List<String> filters = [
    "All",
    "Brand",
    "Dept",
    "Category",
    "Active Item",
    "InActive Item"
  ];

  final List<Map<String, dynamic>> items = [
    {
      'name': 'Kit Kat',
      'gstin': 'TRSHS86',
      'rate': '500.00',
      'isSelected': true,
    },
    {
      'name': 'Kit Kat',
      'gstin': 'TRSHS86',
      'rate': '500.00',
      'isSelected': true,
    },
    {
      'name': 'Kit Kat',
      'gstin': 'TRSHS86',
      'rate': '500.00',
      'isSelected': false,
    },
    {
      'name': 'Kit Kat',
      'gstin': 'TRSHS86',
      'rate': '500.00',
      'isSelected': false,
    },
    {
      'name': 'Kit Kat',
      'gstin': 'TRSHS86',
      'rate': '500.00',
      'isSelected': true,
    },
    {
      'name': 'Kit Kat',
      'gstin': 'TRSHS86',
      'rate': '500.00',
      'isSelected': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryButtonColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Link Items",
            style: TextStyle(
                color: AppColors.primaryButtonColor,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16, bottom: 16, top: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Supplier's Firm Name / Phone No",
                      hintStyle: TextStyle(color: AppColors.lightGrey),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.primaryButtonColor,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      constraints: const BoxConstraints(maxHeight: 35),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextFieldWithTitle(
              label: 'GSTIN',
              hintText: 'Enter GSTIN',
              controller: gstinController,
            ),
            CustomTextFieldWithTitle(
              label: 'Address',
              hintText: 'Enter Address',
              controller: addressController,
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Item Name",
                    hintStyle: TextStyle(color: AppColors.lightGrey),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.search,
                        color: AppColors.primaryButtonColor,
                        size: 18,
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints.loose(Size(30, 30)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    constraints: const BoxConstraints(maxHeight: 25),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Wrap(
              spacing: 20.0,
              runSpacing: 10.0,
              children: filters.map((filter) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = filter;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        selectedFilter == filter
                            ? Icons.check_circle_rounded
                            : Icons.radio_button_unchecked,
                        color: selectedFilter == filter
                            ? AppColors.primaryButtonColor
                            : AppColors.lightGrey,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      SizedBox(
                          width: filter != 'Minimum Stock' ? 60 : null,
                          child: Text(filter)),
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
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
                              left: 12, top: 12, bottom: 12, right: 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildRow(
                                'Name',
                                items[index]['name'] ?? '',
                              ),
                              _buildRow(
                                'GSTIN',
                                items[index]['gstin'] ?? '',
                              ),
                              _buildRow(
                                'Rate',
                                items[index]['rate'] ?? '',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 20,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              items[index]['isSelected'] =
                                  !items[index]['isSelected'];
                            });
                          },
                          icon: Icon(
                            items[index]['isSelected']
                                ? Icons.radio_button_checked_outlined
                                : Icons.circle_outlined,
                            color: AppColors.primaryButtonColor,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            if (!isKeyboardVisible) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton("Update", true),
                  _buildButton("Clear", false),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, bool isColor) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          side: BorderSide(
              color:
                  isColor ? Colors.transparent : AppColors.primaryButtonColor),
          minimumSize: Size(displayWidth(context) / 2.3, 40),
          backgroundColor:
              isColor ? AppColors.primaryButtonColor : AppColors.whiteColor),
      onPressed: () {},
      child: Row(
        children: [
          Text(text,
              style: TextStyle(
                  color: isColor
                      ? AppColors.whiteColor
                      : AppColors.lightBlackColor,
                  fontSize: 15)),
        ],
      ),
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
