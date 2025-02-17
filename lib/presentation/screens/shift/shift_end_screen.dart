import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/common_gesture_button.dart';

class ShiftEndScreen extends StatefulWidget {
  const ShiftEndScreen({super.key});

  @override
  State createState() => _ShiftEndScreenState();
}

class _ShiftEndScreenState extends State<ShiftEndScreen> {
  TextEditingController adjustmentController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  List<Map<String, dynamic>> cashEntries = [
    {
      'paymentMode': 'Cash',
      'total': '0.00',
    },
    {
      'paymentMode': 'Card',
      'total': '0.00',
    },
    {
      'paymentMode': 'Coupon',
      'total': '0.00',
    },
    {
      'paymentMode': 'PettyCash',
      'total': '0.00',
    },
    {
      'paymentMode': 'Cash',
      'total': '0.00',
    },
    {
      'paymentMode': 'Wallet',
      'total': '0.00',
    },
    {
      'paymentMode': 'Reward Points',
      'total': '0.00',
    },
    {
      'paymentMode': 'Paytm',
      'total': '0.00',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    adjustmentController.dispose();
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: -10,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryButtonColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Shift End",
            style: TextStyle(color: AppColors.primaryButtonColor)),
        actions: [
          CommonGestureButton(
            onTap: () {
              Navigator.of(context).pop();
            },
            text: 'End Shift',
            color: Color(0xFF3D3D3D),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Shift No : 4',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryButtonColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text("Payment Mode",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                    Expanded(
                        child: Text(
                      "Total",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.end,
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cashEntries.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 30,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                            cashEntries[index]["paymentMode"],
                          )),
                          Expanded(
                              child: Text(cashEntries[index]["total"],
                                  textAlign: TextAlign.end)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              adjustmentFields(),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryButtonColor,
                  minimumSize: Size(double.infinity, 40),
                ),
                onPressed: () {},
                child: Text("Print",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget adjustmentFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Adjustment",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF9E122C),
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
            height: 40,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "0.00",
                hintStyle: TextStyle(color: Color(0xFFCFCFCF)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFCFCFCF)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFCFCFCF)),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Adjustment Reason",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF9E122C), // Adjust color
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
            height: 40,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Adjustment Reason",
                hintStyle: TextStyle(color: Color(0xFFCFCFCF)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFCFCFCF)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFCFCFCF)),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
