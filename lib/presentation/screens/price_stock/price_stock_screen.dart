import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';

class PriceStockScreen extends StatefulWidget {
  const PriceStockScreen({super.key});

  @override
  State<PriceStockScreen> createState() => _PriceStockScreenState();
}

class _PriceStockScreenState extends State<PriceStockScreen> {
  final _barcodeController = TextEditingController();
  final _itemNameController = TextEditingController();
  String selectedFilter = "All";
  final List<String> filters = [
    "All",
    "Brand",
    "Dept",
    "Category",
    "Active",
    "InActive",
    "Minimum Stock"
  ];

  final List<Map<String, dynamic>> items = [
    {
      'name': 'Kitkat',
      'qty': '38',
      'mrp': '20',
      'retail_price': '18',
      'whole_sale_price': '15',
    },
    {
      'name': 'Dairy Milk',
      'qty': '38',
      'mrp': '20',
      'retail_price': '18',
      'whole_sale_price': '15',
    },
    {
      'name': 'Boomer',
      'qty': '38',
      'mrp': '20',
      'retail_price': '18',
      'whole_sale_price': '15',
    },
    {
      'name': 'Kinder Joy',
      'qty': '38',
      'mrp': '20',
      'retail_price': '18',
      'whole_sale_price': '15',
    },
    {
      'name': '5 Star',
      'qty': '38',
      'mrp': '20',
      'retail_price': '18',
      'whole_sale_price': '15',
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
          'Price / Stock',
          style: TextStyle(color: AppColors.primaryButtonColor),
        ),
        titleSpacing: -15,
        actions: [
          SizedBox(
            height: 23,
            width: 80,
            child: TextField(
              controller: _barcodeController,
              cursorHeight: 15,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Icon(
                    Icons.search,
                    size: 15,
                    color: AppColors.primaryButtonColor,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
                hintText: 'Barcode',
                contentPadding: const EdgeInsets.only(left: 7, top: 0),
                constraints: BoxConstraints(maxHeight: 35),
                hintStyle: TextStyle(fontSize: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xFFE4E4E4)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xFFE4E4E4)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xFFE4E4E4)),
                ),
              ),
              onChanged: (value) {},
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          SizedBox(
            height: 23,
            width: 120,
            child: TextField(
              controller: _itemNameController,
              cursorHeight: 15,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Icon(
                    Icons.search,
                    size: 15,
                    color: AppColors.primaryButtonColor,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
                hintText: 'Item Name/ Short Code',
                contentPadding: const EdgeInsets.only(left: 7, top: 0),
                constraints: BoxConstraints(maxHeight: 35),
                hintStyle: TextStyle(fontSize: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xFFE4E4E4)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xFFE4E4E4)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xFFE4E4E4)),
                ),
              ),
              onChanged: (value) {},
            ),
          ),
          const SizedBox(
            width: 10,
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
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: selectedFilter == filter
                            ? AppColors.primaryButtonColor
                            : AppColors.lightGrey,
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
                                'QTY',
                                items[index]['qty'] ?? '',
                              ),
                              _buildRow(
                                'MRP',
                                items[index]['mrp'] ?? '',
                              ),
                              _buildRow(
                                'Retail Price',
                                items[index]['retail_price'] ?? '',
                              ),
                              _buildRow(
                                'Whole Sale Price',
                                items[index]['whole_sale_price'] ?? '',
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
                          )),
                      Positioned(
                          bottom: 25,
                          right: 20,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primaryButtonColor,
                            ),
                            child: Text(
                              'Stock',
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ))
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
