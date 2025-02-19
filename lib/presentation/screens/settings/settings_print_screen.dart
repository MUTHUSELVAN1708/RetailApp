import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/custom_svg.dart';

class SettingsPrintScreen extends StatefulWidget {
  const SettingsPrintScreen({super.key});

  @override
  State<SettingsPrintScreen> createState() => _SettingsPrintScreenState();
}

class _SettingsPrintScreenState extends State<SettingsPrintScreen> {
  final List<String> printerTypes = [
    "Token Printer",
    "Bill Printer",
    "Receipt Printer",
    "Report Printer"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var printer in printerTypes) buildPrinterSelector(printer),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryButtonColor,
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              child: Text("Discover Devices", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPrinterSelector(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select",
            style: TextStyle(fontSize: 15, color: AppColors.blackColor),
          ),
          SizedBox(height: 5),
          GestureDetector(
            onTap: () async {
              final result = await showPrinterConnectivityDialog(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.lightGrey)),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Save $title',
                      style:
                          TextStyle(fontSize: 15, color: AppColors.lightGrey),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.lightGrey,
                      size: 25,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildButton("Save $title", isWhite: true),
              _buildButton("Reset", isWhite: false),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildButton(String text, {bool isWhite = true, String? title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(title, style: TextStyle(fontSize: 15)),
          SizedBox(height: 5),
        ],
        SizedBox(
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  isWhite ? AppColors.whiteColor : AppColors.primaryButtonColor,
              side: BorderSide(color: AppColors.primaryButtonColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
            onPressed: () async {},
            child: Text(text,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isWhite
                        ? AppColors.primaryButtonColor
                        : AppColors.whiteColor)),
          ),
        ),
      ],
    );
  }

  Future<PrinterConnectivity?> showPrinterConnectivityDialog(
      BuildContext context) {
    PrinterConnectivity? selectedConnectivity = PrinterConnectivity.bluetooth;

    return showDialog<PrinterConnectivity>(
      context: context,
      barrierColor: Color(0xFF9E122C).withValues(alpha: 0.4),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return AlertDialog(
              title: const Text(
                'Choose Bill Printer Connectivity',
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.bluetooth,
                            color: selectedConnectivity ==
                                    PrinterConnectivity.bluetooth
                                ? AppColors.primaryButtonColor
                                : AppColors.blackColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Bluetooth Printer',
                            style: TextStyle(
                                color: selectedConnectivity ==
                                        PrinterConnectivity.bluetooth
                                    ? AppColors.primaryButtonColor
                                    : AppColors.blackColor),
                          ),
                        ],
                      ),
                      Radio<PrinterConnectivity>(
                        value: PrinterConnectivity.bluetooth,
                        groupValue: selectedConnectivity,
                        activeColor: AppColors.primaryButtonColor,
                        onChanged: (PrinterConnectivity? value) {
                          setState(() {
                            selectedConnectivity = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.usb,
                            color:
                                selectedConnectivity == PrinterConnectivity.usb
                                    ? AppColors.primaryButtonColor
                                    : AppColors.blackColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'USB Printer',
                            style: TextStyle(
                                color: selectedConnectivity ==
                                        PrinterConnectivity.usb
                                    ? AppColors.primaryButtonColor
                                    : AppColors.blackColor),
                          ),
                        ],
                      ),
                      Radio<PrinterConnectivity>(
                        value: PrinterConnectivity.usb,
                        groupValue: selectedConnectivity,
                        activeColor: AppColors.primaryButtonColor,
                        onChanged: (PrinterConnectivity? value) {
                          setState(() {
                            selectedConnectivity = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.wifi,
                            color:
                                selectedConnectivity == PrinterConnectivity.wifi
                                    ? AppColors.primaryButtonColor
                                    : AppColors.blackColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Wifi Printer',
                            style: TextStyle(
                                color: selectedConnectivity ==
                                        PrinterConnectivity.wifi
                                    ? AppColors.primaryButtonColor
                                    : AppColors.blackColor),
                          ),
                        ],
                      ),
                      Radio<PrinterConnectivity>(
                        value: PrinterConnectivity.wifi,
                        groupValue: selectedConnectivity,
                        activeColor: AppColors.primaryButtonColor,
                        onChanged: (PrinterConnectivity? value) {
                          setState(() {
                            selectedConnectivity = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                    ),
                    onPressed: () {},
                    child: Text("Proceed",
                        style: TextStyle(
                            fontSize: 16, color: AppColors.whiteColor)),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel",
                        style: TextStyle(
                            color: AppColors.blackColor, fontSize: 16)),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}

enum PrinterConnectivity {
  bluetooth,
  usb,
  wifi,
}
