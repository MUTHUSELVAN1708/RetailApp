import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/core/utils/helper.dart';
import 'package:retail_mobile/core/utils/nav_helper.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class GeneratePoScreen extends StatefulWidget {
  const GeneratePoScreen({super.key});

  @override
  State<GeneratePoScreen> createState() => _GeneratePoScreenState();
}

class _GeneratePoScreenState extends State<GeneratePoScreen> {
  final phoneController = TextEditingController();
  final gstinController = TextEditingController();
  final addressController = TextEditingController();
  final purchaseController = TextEditingController();
  final mrpController = TextEditingController();
  final qtyController = TextEditingController();
  final retailController = TextEditingController();

  final additionalchargeController = TextEditingController();
  final additionalamountController = TextEditingController();
  final subtotalController = TextEditingController();
  final granttotalController = TextEditingController();

  final List<ItemEntry> items = [
    ItemEntry(
      hsnCode: '100028',
      itemName: 'Kitkat',
      purchasePrice: 0.00,
      qty: 38,
      uom: 'DOZ',
      taxableValue: 0.00,
      igst: 0.00,
      cgst: 0.00,
      utgstSgst: 0.00,
      cess: 3890.00,
      totalTax: 3890.00,
      amount: 3890.00,
    ),
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
          'Generate PO',
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
                  hintText: "Customer Name (or) Phone Number",
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              CustomTextFieldWithTitle(
                label: 'Phone No',
                hintText: 'phone no',
                controller: phoneController,
              ),
              CustomTextFieldWithTitle(
                label: 'GSTIN',
                hintText: 'gstin',
                controller: gstinController,
              ),
              CustomTextFieldWithTitle(
                label: 'Address',
                hintText: 'address',
                controller: addressController,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          const Icon(Icons.circle_outlined,
                              color: AppColors.primaryButtonColor),
                          const SizedBox(width: 8),
                          const Text('Customer State Code'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomTextFieldWithTitle(
                label: 'MRP',
                hintText: 'MRP',
                controller: mrpController,
                inputType: TextInputType.number,
              ),
              CustomTextFieldWithTitle(
                label: 'QTY',
                hintText: 'QTY',
                controller: qtyController,
                inputType: TextInputType.number,
              ),
              CustomTextFieldWithTitle(
                label: 'Purchase Price',
                hintText: 'Purchase Price',
                controller: purchaseController,
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add_circle_outline_outlined,
                      color: Colors.white),
                  label: const Text('Add',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryButtonColor,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 300,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var item in items) ItemCard(item: item),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          const Icon(Icons.circle_outlined,
                              color: AppColors.primaryButtonColor),
                          const SizedBox(width: 8),
                          const Text('Additional Charge'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomTextFieldWithTitle(
                label: 'Additional Charge Name',
                hintText: 'phone no',
                controller: additionalchargeController,
              ),
              CustomTextFieldWithTitle(
                label: 'Additional Amount',
                hintText: 'gstin',
                controller: additionalamountController,
              ),
              CustomTextFieldWithTitle(
                label: 'Sub Total',
                hintText: 'address',
                controller: subtotalController,
              ),
              CustomTextFieldWithTitle(
                label: 'Grant Total',
                hintText: 'deposit amount',
                controller: granttotalController,
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text('Generate PO',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryButtonColor,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemEntry {
  final String hsnCode;
  final String itemName;
  final double purchasePrice;
  final int qty;
  final String uom;
  final double taxableValue;
  final double igst;
  final double cgst;
  final double utgstSgst;
  final double cess;
  final double totalTax;
  final double amount;

  ItemEntry({
    required this.hsnCode,
    required this.itemName,
    required this.purchasePrice,
    required this.qty,
    required this.uom,
    required this.taxableValue,
    required this.igst,
    required this.cgst,
    required this.utgstSgst,
    required this.cess,
    required this.totalTax,
    required this.amount,
  });
}

class ItemCard extends StatelessWidget {
  final ItemEntry item;

  const ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('HSN Code', style: TextStyle(color: Colors.grey.shade600)),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit,
                        color: Color(0xFFA41E34), size: 20),
                    onPressed: () {},
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.delete,
                        color: Color(0xFFA41E34), size: 20),
                    onPressed: () {},
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ],
          ),
          Text(item.hsnCode,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          // Item details
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Item Name',
                        style: TextStyle(color: Colors.grey.shade600)),
                    Text(item.itemName,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Purchase Price',
                        style: TextStyle(color: Colors.grey.shade600)),
                    Text('₹${item.purchasePrice}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // More details
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('QTY', style: TextStyle(color: Colors.grey.shade600)),
                    Text(item.qty.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('UOM', style: TextStyle(color: Colors.grey.shade600)),
                    Text(item.uom,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Tax details
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Taxable Value',
                        style: TextStyle(color: Colors.grey.shade600)),
                    Text('₹${item.taxableValue}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('IGST', style: TextStyle(color: Colors.grey.shade600)),
                    Text('₹${item.igst}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // More tax details
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CGST', style: TextStyle(color: Colors.grey.shade600)),
                    Text('₹${item.cgst}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('UTGST / SGST',
                        style: TextStyle(color: Colors.grey.shade600)),
                    Text('₹${item.utgstSgst}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Final details
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cess', style: TextStyle(color: Colors.grey.shade600)),
                    Text('₹${item.cess}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Tax',
                        style: TextStyle(color: Colors.grey.shade600)),
                    Text('₹${item.totalTax}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Amount
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Amount',
                        style: TextStyle(color: Colors.grey.shade600)),
                    Text('₹${item.amount}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}
