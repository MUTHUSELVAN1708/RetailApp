import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/core/utils/barcode_scanner.dart'
    show BarcodeScannerScreen;
import 'package:retail_mobile/presentation/widgets/custom_svg.dart';

class BarcodeScanner extends StatefulWidget {
  final bool isCart;

  const BarcodeScanner({super.key, required this.isCart});

  @override
  State createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  final _searchController = TextEditingController();

  Future<String?> _scanBarcode() async {
    String? result = await BarcodeScannerScreen.scanBarcode(context);
    print(result);
    return result;
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
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 4),
                    child: Icon(
                      Icons.search,
                      size: 20,
                      color: AppColors.primaryButtonColor,
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 30,
                    minHeight: 20,
                  ),
                  hintText: '${widget.isCart ? 'Search ' : ''}Product/Item No',
                  contentPadding: const EdgeInsets.only(left: 7),
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
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () async {
              final barCode = await _scanBarcode();
            },
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
