import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/core/utils/helper.dart';
import 'package:retail_mobile/core/utils/nav_helper.dart';
import 'package:retail_mobile/presentation/screens/supplier_details/add_supplier_details_screen.dart';

class SupplierDetailsScreen extends StatefulWidget {
  const SupplierDetailsScreen({super.key});

  @override
  State<SupplierDetailsScreen> createState() => SupplierDetailsScreenState();
}

class SupplierDetailsScreenState extends State<SupplierDetailsScreen> {
  String selectedFilter = "All";
  final List<String> filters = [
    "All",
    "Active Supplier",
    "InActive Supplier",
  ];

  final List<Map<String, dynamic>> items = [
    {
      'supplierName': 'Kit Kat',
      'phoneNo': '380',
      'gstin': 'THD',
      'address': '300',
      'mode': 'Active',
    },
    {
      'supplierName': 'Kit Kat',
      'phoneNo': '380',
      'gstin': 'THD',
      'address': '300',
      'mode': 'Active',
    },
    {
      'supplierName': 'Kit Kat',
      'phoneNo': '380',
      'gstin': 'THD',
      'address': '300',
      'mode': 'Active',
    },
    {
      'supplierName': 'Kit Kat',
      'phoneNo': '380',
      'gstin': 'THD',
      'address': '300',
      'mode': 'Active',
    },
    {
      'supplierName': 'Kit Kat',
      'phoneNo': '380',
      'gstin': 'THD',
      'address': '300',
      'mode': 'Active',
    },
  ];

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
          'Supplier Details',
          style: TextStyle(
            color: AppColors.primaryButtonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
              width: 180,
              height: 25,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Supplier Name / Phone No",
                  hintStyle: TextStyle(color: AppColors.lightGrey),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Icon(
                      Icons.search,
                      color: AppColors.primaryButtonColor,
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(minWidth: 25),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  constraints: const BoxConstraints(maxHeight: 35),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16, bottom: 16, top: 10),
        child: Column(
          children: [
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
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: selectedFilter == filter
                            ? AppColors.primaryButtonColor
                            : AppColors.lightGrey,
                      ),
                      SizedBox(width: 5),
                      SizedBox(
                          // width: filter != 'Minimum Stock' ? 60
                          //     : null,
                          child: Text(filter)),
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                NavigationHelper.slideNavigateTo(
                    context: context, screen: AddSupplierDetailsScreen());
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryButtonColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline_outlined,
                      color: AppColors.whiteColor,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('Add',
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15))
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
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
                                'Supplier Name',
                                items[index]['supplierName'] ?? '',
                              ),
                              _buildRow(
                                'Phone No',
                                items[index]['phoneNo'] ?? '',
                              ),
                              _buildRow(
                                'GSTIN',
                                items[index]['gstin'] ?? '',
                              ),
                              _buildRow(
                                'Address',
                                items[index]['address'] ?? '',
                              ),
                              _buildRow(
                                'Mode',
                                items[index]['mode'] ?? '',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: 10,
                          right: 20,
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
                  );
                },
              ),
            ),
          ],
        ),
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
