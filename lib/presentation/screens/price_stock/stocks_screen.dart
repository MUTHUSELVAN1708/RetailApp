import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class StocksScreen extends StatefulWidget {
  const StocksScreen({super.key});

  @override
  State<StocksScreen> createState() => _StocksScreenState();
}

class _StocksScreenState extends State<StocksScreen> {
  final _mrpController = TextEditingController(text: '300');
  final _itemNameController = TextEditingController(text: 'Kit Kat');

  final List<Map<String, dynamic>> items = [
    {
      'batch_no': '124',
      'item_barcode': '3278322',
      'purchase_price': '20',
      'mrp': '25',
      'in_stock': '40',
      'expiry_date': '23.09.2025',
    },
    {
      'batch_no': '124',
      'item_barcode': '3278322',
      'purchase_price': '20',
      'mrp': '25',
      'in_stock': '40',
      'expiry_date': '23.09.2025',
    },
    {
      'batch_no': '124',
      'item_barcode': '3278322',
      'purchase_price': '20',
      'mrp': '25',
      'in_stock': '40',
      'expiry_date': '23.09.2025',
    },
    {
      'batch_no': '124',
      'item_barcode': '3278322',
      'purchase_price': '20',
      'mrp': '25',
      'in_stock': '40',
      'expiry_date': '23.09.2025',
    },
    {
      'batch_no': '124',
      'item_barcode': '3278322',
      'purchase_price': '20',
      'mrp': '25',
      'in_stock': '40',
      'expiry_date': '23.09.2025',
    },
    {
      'batch_no': '124',
      'item_barcode': '3278322',
      'purchase_price': '20',
      'mrp': '25',
      'in_stock': '40',
      'expiry_date': '23.09.2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryButtonColor,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Stocks',
          style: TextStyle(color: AppColors.primaryButtonColor),
        ),
        titleSpacing: -15,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16.0, right: 16, bottom: 16, top: 10),
        child: Column(
          children: [
            CustomTextFieldWithTitle(
              controller: _itemNameController,
              hintText: 'Enter Item Name',
              label: 'Item Name',
              readOnly: true,
            ),
            CustomTextFieldWithTitle(
              controller: _mrpController,
              hintText: 'Enter MRP',
              label: 'MRP',
              readOnly: true,
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 12, top: 12, bottom: 12, right: 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildRow(
                                'Batch No',
                                items[index]['batch_no'] ?? '',
                              ),
                              _buildRow(
                                'Item Barcode',
                                items[index]['item_barcode'] ?? '',
                              ),
                              _buildRow(
                                'Purchase Price',
                                items[index]['purchase_price'] ?? '',
                              ),
                              _buildRow(
                                'MRP',
                                items[index]['mrp'] ?? '',
                              ),
                              _buildRow(
                                'In Stock',
                                items[index]['in_stock'] ?? '',
                              ),
                              _buildRow(
                                'Expiry Date',
                                items[index]['expiry_date'] ?? '',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 10),
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
