import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/custom_svg.dart';

class BarcodeScanner extends StatefulWidget {
  final bool isCart;

  const BarcodeScanner({super.key, required this.isCart});

  @override
  State createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  final _searchController = TextEditingController();

  void _scanBarcode() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BarcodeScannerScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            widget.isCart ? 'CART' : 'PRODUCTS',
            style: TextStyle(
                fontSize: 15,
                color: widget.isCart
                    ? AppColors.primaryButtonColor
                    : AppColors.blackColor),
          ),
          SizedBox(width: widget.isCart ? 10 : 8),
          Expanded(
            child: SizedBox(
              height: 25,
              child: TextField(
                controller: _searchController,
                cursorHeight: 15,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color: AppColors.primaryButtonColor,
                  ),
                  prefixIconConstraints:
                      BoxConstraints(maxHeight: 20, maxWidth: 30),
                  hintText: '${widget.isCart ? 'Search ' : ''}Product/Item No',
                  contentPadding: const EdgeInsets.only(left: 7),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xFFE4E4E4))),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xFFE4E4E4))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xFFE4E4E4))),
                ),
                onChanged: (value) {},
              ),
            ),
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: _scanBarcode,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
              decoration: BoxDecoration(
                  color: Color(0xFFFFE3E9),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  CustomSvg(
                    name: 'scan',
                    height: 15,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text('Scan code'),
                ],
              ),
            ),
          ),
          SizedBox(width: 8),
          if (!widget.isCart)
            GestureDetector(onTap: () {}, child: CustomSvg(name: 'plus_icon')),
        ],
      ),
    );
  }
}

class BarcodeScannerScreen extends StatelessWidget {
  const BarcodeScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.primaryButtonColor,
              )),
          title: Text(
            'Scan Barcode',
            style: TextStyle(color: AppColors.primaryButtonColor),
          )),
      body: MobileScanner(
        onDetect: (barcode) {
          final String code = barcode.raw.toString();
          Navigator.pop(context, code);
        },
      ),
    );
  }
}
