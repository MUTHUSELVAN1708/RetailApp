import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/screens/shift/shift_end_screen.dart';
import 'package:retail_mobile/presentation/widgets/common_gesture_button.dart';

class ShiftStartScreen extends StatefulWidget {
  const ShiftStartScreen({super.key});

  @override
  State createState() => _ShiftStartScreenState();
}

class _ShiftStartScreenState extends State<ShiftStartScreen> {
  TextEditingController cashValueController = TextEditingController();
  TextEditingController cashCountController = TextEditingController();
  List<Map<String, dynamic>> cashEntries = [];
  double grandTotal = 0.0;
  double totalAmount = 0.0;

  void calculateTotal() {
    setState(() {});
  }

  void addEntry() {
    double cashValue = double.tryParse(cashValueController.text) ?? 0.0;
    double cashCount = double.tryParse(cashCountController.text) ?? 0.0;
    double total = cashValue * cashCount;

    if (cashValue > 0 && cashCount > 0) {
      setState(() {
        cashEntries.add({
          "cashValue": cashValue.toStringAsFixed(2),
          "cashCount": cashCount.toStringAsFixed(2),
          "total": total.toStringAsFixed(2),
        });
        grandTotal += total;
        cashValueController.clear();
        cashCountController.clear();
      });
    }
  }

  void deleteEntry(int index) {
    setState(() {
      grandTotal -= double.parse(cashEntries[index]["total"]);
      cashEntries.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    cashValueController.addListener(calculateTotal);
    cashCountController.addListener(calculateTotal);
  }

  @override
  void dispose() {
    cashValueController.dispose();
    cashCountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryButtonColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        titleSpacing: -10,
        title: Text("Shift Start",
            style: TextStyle(color: AppColors.primaryButtonColor)),
        actions: [
          CommonGestureButton(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ShiftEndScreen();
              }));
            },
            text: 'Start Shift',
            color: AppColors.primaryButtonColor,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Opening Balance : 4.00",
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    Text(
                      'Shift No : ',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 12,
                      width: 70,
                      child: TextField(
                        cursorHeight: 14,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          labelText: '',
                          labelStyle: TextStyle(fontSize: 16),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black), // Underline color
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black), // Color when focused
                          ),
                        ),
                      ),
                    )
                  ],
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
                      child: Text("Cash Value",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Expanded(
                      child: Text("Cash Count",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Expanded(
                      child: Text("Total",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Expanded(
                      child: Text("Delete",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cashEntries.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(cashEntries[index]["cashValue"],
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Text(cashEntries[index]["cashCount"],
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Text(cashEntries[index]["total"],
                                textAlign: TextAlign.center)),
                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.delete_forever_rounded,
                                color: AppColors.primaryButtonColor),
                            onPressed: () => deleteEntry(index),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Text(
              "Grand Total : ${grandTotal.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 15),
            buildRow(),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryButtonColor,
                minimumSize: Size(double.infinity, 40),
              ),
              onPressed: addEntry,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle_outline_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text("Add",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Cash Value", style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            buildTextField(cashValueController, false),
          ],
        ),
        SizedBox(width: 10),
        Text("*", style: TextStyle(fontSize: 20)),
        SizedBox(width: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Cash Count", style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            buildTextField(cashCountController, true),
          ],
        ),
        SizedBox(width: 10),
        Text("=", style: TextStyle(fontSize: 20)),
        SizedBox(width: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Total", style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Container(
              width: 80,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xFFC3C3C3))),
              child: Text(
                ((double.tryParse(cashValueController.text) ?? 0.0) *
                        (double.tryParse(cashCountController.text) ?? 0.0))
                    .toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 16,
                    color: ((double.tryParse(cashValueController.text) ?? 0.0) *
                                (double.tryParse(cashCountController.text) ??
                                    0.0)) >
                            0
                        ? AppColors.blackColor
                        : Color(0xFFC3C3C3)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildTextField(TextEditingController controller, bool isCount) {
    return SizedBox(
      width: 80,
      height: 35,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.center,
        cursorHeight: 15,
        decoration: InputDecoration(
          hintText: isCount ? '0' : '0.00',
          hintStyle: TextStyle(color: Color(0xFFC3C3C3)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFC3C3C3)),
          ),
          contentPadding: EdgeInsets.only(top: 10),
        ),
        onChanged: (value) => calculateTotal(),
      ),
    );
  }
}
