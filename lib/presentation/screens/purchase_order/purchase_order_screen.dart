import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class PurchaseOrderScreen extends StatefulWidget {
  const PurchaseOrderScreen({super.key});

  @override
  State<PurchaseOrderScreen> createState() => _PurchaseOrderScreenState();
}

class _PurchaseOrderScreenState extends State<PurchaseOrderScreen> {
  final addressController = TextEditingController();
  final gstinController = TextEditingController();
  final supplierPhoneController = TextEditingController();
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
        title: const Text('Purchase Order',
            style: TextStyle(color: AppColors.primaryButtonColor)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: AppColors.primaryButtonColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFieldWithTitle(
                  label: 'Supplier Phone Number',
                  hintText: 'Enter Supplier Phone Number',
                  controller: supplierPhoneController,
                ),
                CustomTextFieldWithTitle(
                  label: 'Supplier GSTIN',
                  hintText: 'Enter Supplier GSTIN',
                  controller: gstinController,
                ),
                CustomTextFieldWithTitle(
                  label: 'Supplier Address',
                  hintText: 'Enter Supplier Address',
                  controller: addressController,
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
                            const Text('Supplier State Code'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            const Icon(Icons.circle_outlined,
                                color: AppColors.primaryButtonColor),
                            const SizedBox(width: 8),
                            const Text('All Items'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                CustomTextFieldWithTitle(
                  label: 'HSN',
                  hintText: 'Enter HSN',
                  controller: addressController,
                ),
                CustomTextFieldWithTitle(
                  label: 'QTY',
                  hintText: 'Enter QTY',
                  controller: addressController,
                ),
                CustomTextFieldWithTitle(
                  label: 'Purchase Price',
                  hintText: 'Enter Purchase Price',
                  controller: addressController,
                ),
                const SizedBox(
                  height: 5,
                ),
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
                const SizedBox(height: 16),

                // Nested scroll view for items
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
                const SizedBox(height: 16),

                // Additional charge section
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.info_outline,
                              color: Color(0xFFA41E34)),
                          const SizedBox(width: 8),
                          const Text('Additional Charge',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Additional Charge Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Additional Amount',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Total section
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Sub Total'),
                          const Text('₹3890.00'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Grand Total',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const Text('₹3890.00',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Bottom buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFA41E34)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Update PO',
                            style: TextStyle(color: Color(0xFFA41E34))),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFA41E34)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Clear',
                            style: TextStyle(color: Color(0xFFA41E34))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Generate PO button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA41E34),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Generate PO',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
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
