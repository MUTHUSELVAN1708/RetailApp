import 'package:flutter/material.dart';
import 'package:retail_mobile/core/utils/helper.dart';
import 'package:retail_mobile/presentation/screens/billing/barcode_scanner.dart';
import 'package:retail_mobile/presentation/screens/cart/cart_product_card.dart';
import 'package:retail_mobile/presentation/screens/cart/cart_total_amount_card.dart';
import 'package:retail_mobile/presentation/screens/cart/expandable_arrow_menu.dart';

class CartScreen extends StatefulWidget {
  final bool isItems;

  const CartScreen({super.key, this.isItems = true});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              BarcodeScanner(
                isCart: true,
              ),
              if (widget.isItems) ...[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return CartProductCard();
                    },
                  ),
                ),
                CartTotalAmountCard(
                  isViewBill: false,
                  controller: _controller,
                ),
              ] else ...[
                SizedBox(
                  height: displayHeight(context) / 5.5,
                ),
                Column(
                  children: [
                    Image.asset('assets/images/amico.png'),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('PLEASE ADD YOUR ITEMS IN CART')
                  ],
                ),
              ]
            ],
          ),
          ExpandableArrowMenu(
            animation: _animation,
            isCart: true,
          ),
        ],
      ),
    );
  }
}
