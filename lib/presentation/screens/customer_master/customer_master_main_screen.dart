import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/core/utils/helper.dart';

class CustomerMasterMainScreen extends StatefulWidget {
  const CustomerMasterMainScreen({super.key});

  @override
  State<CustomerMasterMainScreen> createState() =>
      _CustomerMasterMainScreenState();
}

class _CustomerMasterMainScreenState extends State<CustomerMasterMainScreen> {
  String selectedFilter = "All";
  final List<String> filters = [
    "All",
    "Active",
    "InActive",
  ];

  final List<Map<String, dynamic>> items = [
    {
      'name': 'Leo',
      'phone': '9898788989',
      'last_petty_cash': '0.00',
      'total_trans': '0.00',
      'credit': '2000',
      'reward': '100',
      'mode': 'Active'
    },
    {
      'name': 'Leo',
      'phone': '9898788989',
      'last_petty_cash': '0.00',
      'total_trans': '0.00',
      'credit': '2000',
      'reward': '100',
      'mode': 'Active'
    },
    {
      'name': 'Leo',
      'phone': '9898788989',
      'last_petty_cash': '0.00',
      'total_trans': '0.00',
      'credit': '2000',
      'reward': '100',
      'mode': 'Active'
    },
    {
      'name': 'Leo',
      'phone': '9898788989',
      'last_petty_cash': '0.00',
      'total_trans': '0.00',
      'credit': '2000',
      'reward': '100',
      'mode': 'Active'
    },
    {
      'name': 'Leo',
      'phone': '9898788989',
      'last_petty_cash': '0.00',
      'total_trans': '0.00',
      'credit': '2000',
      'reward': '100',
      'mode': 'Active'
    },
    {
      'name': 'Leo',
      'phone': '9898788989',
      'last_petty_cash': '0.00',
      'total_trans': '0.00',
      'credit': '2000',
      'reward': '100',
      'mode': 'Active'
    },
    {
      'name': 'Leo',
      'phone': '9898788989',
      'last_petty_cash': '0.00',
      'total_trans': '0.00',
      'credit': '2000',
      'reward': '100',
      'mode': 'Active'
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
        title: Text("Customer Master",
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
                      hintText: "Customer Name / Phone No",
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
            SizedBox(height: 10),
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
                      SizedBox(width: 60, child: Text(filter)),
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
                                'Phone No',
                                items[index]['phone'] ?? '',
                              ),
                              _buildRow(
                                'Last Petty TranSn',
                                items[index]['last_petty_cash'] ?? '',
                              ),
                              _buildRow(
                                'Total TranSn',
                                items[index]['total_trans'] ?? '',
                              ),
                              _buildRow(
                                'Credit Amount',
                                items[index]['credit'] ?? '',
                              ),
                              _buildRow(
                                'Reward Points',
                                items[index]['reward'] ?? '',
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
                              'Passbook',
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ))
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
                  _buildButton("Export CSV"),
                  _buildButton("+ Add"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton("Sample CSV"),
                  _buildButton("Browse File"),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryButtonColor,
                  minimumSize: Size(double.infinity, 40),
                ),
                onPressed: () {},
                child:
                    Text("Upload File", style: TextStyle(color: Colors.white)),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          side: BorderSide(color: AppColors.primaryButtonColor),
          minimumSize: Size(displayWidth(context) / 2.3, 40),
          backgroundColor: AppColors.whiteColor),
      onPressed: () {},
      child: Text(text, style: TextStyle(color: AppColors.primaryButtonColor)),
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
