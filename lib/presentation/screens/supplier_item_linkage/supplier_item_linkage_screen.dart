import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/core/utils/helper.dart';
import 'package:retail_mobile/core/utils/nav_helper.dart';
import 'package:retail_mobile/presentation/screens/supplier_details/add_supplier_details_screen.dart';
import 'package:retail_mobile/presentation/screens/supplier_item_linkage/link_items_screen.dart';

class SupplierItemLinkageScreen extends StatefulWidget {
  const SupplierItemLinkageScreen({super.key});

  @override
  State<SupplierItemLinkageScreen> createState() =>
      SupplierItemLinkageScreenState();
}

class SupplierItemLinkageScreenState extends State<SupplierItemLinkageScreen> {
  String selectedFilter = "All";
  final List<String> filters = [
    "All",
    "Active Supplier",
    "InActive Supplier",
    'Active Item',
    'InActive Item'
  ];

  final List<Map<String, dynamic>> items = [
    {
      'supplierFirmName': 'Kit Kat',
      'itemName': '380',
      'purchasePrice': 'THD',
      'uom': '300',
    },
    {
      'supplierFirmName': 'Kit Kat',
      'itemName': '380',
      'purchasePrice': 'THD',
      'uom': '300',
    },
    {
      'supplierFirmName': 'Kit Kat',
      'itemName': '380',
      'purchasePrice': 'THD',
      'uom': '300',
    },
    {
      'supplierFirmName': 'Kit Kat',
      'itemName': '380',
      'purchasePrice': 'THD',
      'uom': '300',
    },
    {
      'supplierFirmName': 'Kit Kat',
      'itemName': '380',
      'purchasePrice': 'THD',
      'uom': '300',
    },
    {
      'supplierFirmName': 'Kit Kat',
      'itemName': '380',
      'purchasePrice': 'THD',
      'uom': '300',
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
          'Supplier Item Linkage',
          style: TextStyle(
            color: AppColors.primaryButtonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
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
                      Text(filter),
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                NavigationHelper.slideNavigateTo(
                    context: context, screen: LinkItemsScreen());
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.primaryButtonColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Link Item',
                        style: TextStyle(
                            color: AppColors.primaryButtonColor,
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
                                'Supplier Firm Name',
                                items[index]['supplierFirmName'] ?? '',
                              ),
                              _buildRow(
                                'Item Name',
                                items[index]['itemName'] ?? '',
                              ),
                              _buildRow(
                                'Purchase Price',
                                items[index]['purchasePrice'] ?? '',
                              ),
                              _buildRow(
                                'UOM',
                                items[index]['uom'] ?? '',
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
