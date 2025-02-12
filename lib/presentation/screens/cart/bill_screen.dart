import 'package:flutter/material.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  String? selectedInterstate;
  bool isMRP = false;
  bool isRetailPrice = false;
  bool isWholeSalePrice = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('BILL'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Payment Method Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildPaymentOption(
                      'Coupon', Icons.confirmation_number_outlined),
                  _buildPaymentOption('Discount', Icons.discount_outlined),
                  _buildPaymentOption('Cash', Icons.account_balance_wallet,
                      isSelected: true),
                  _buildPaymentOption('Other Cards', Icons.credit_card),
                  _buildPaymentOption('Paytm', Icons.payment),
                ],
              ),
              SizedBox(height: 20),

              // Form Fields
              TextField(
                decoration: InputDecoration(
                  labelText: 'Bill No',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Count',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),

              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Interstate',
                  border: OutlineInputBorder(),
                ),
                value: selectedInterstate,
                items: ['Option 1', 'Option 2'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedInterstate = newValue;
                  });
                },
              ),
              SizedBox(height: 12),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone No',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 12),

              TextField(
                decoration: InputDecoration(
                  labelText: 'GSTIN',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),

              // Price Type Checkboxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCheckbox('MRP', isMRP),
                  _buildCheckbox('Retail price', isRetailPrice),
                  _buildCheckbox('Whole Sale Price', isWholeSalePrice),
                ],
              ),
              SizedBox(height: 20),

              // Bill Details
              _buildBillRow('Total Qty', '45'),
              _buildBillRow('Discount', '(5%) ₹45'),
              _buildBillRow('Round Off', 'Rs 415.00/-'),
              _buildBillRow('IGST Amount', 'Rs 5.00/-'),
              _buildBillRow('SGST Amount', 'Rs 5.00/-'),
              _buildBillRow('Cess Amount', 'Rs 5.00/-'),
              _buildBillRow('Total Taxable Value', 'Rs 5.00/-'),
              _buildBillRow('Other Charges', 'Rs 5.00/-'),
              _buildBillRow('Total Amount', 'Rs 715.00/-', isTotal: true),

              SizedBox(height: 20),

              // Bottom Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[800],
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {},
                      child: Text('Pay'),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[800],
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {},
                      child: Text('Pay & Print'),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {},
                      child: Text('Cancel'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String label, IconData icon,
      {bool isSelected = false}) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.red[50] : Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isSelected ? Colors.red : Colors.grey,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildCheckbox(String label, bool value) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (bool? newValue) {
            setState(() {
              if (label == 'MRP') isMRP = newValue ?? false;
              if (label == 'Retail price') isRetailPrice = newValue ?? false;
              if (label == 'Whole Sale Price')
                isWholeSalePrice = newValue ?? false;
            });
          },
          activeColor: Colors.red,
        ),
        Text(label),
      ],
    );
  }

  Widget _buildBillRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.red : Colors.black,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
