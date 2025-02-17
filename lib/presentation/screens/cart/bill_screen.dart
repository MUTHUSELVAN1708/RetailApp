import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/core/utils/animation.dart';
import 'package:retail_mobile/presentation/screens/cart/cart_total_amount_card.dart';
import 'package:retail_mobile/presentation/screens/cart/expandable_arrow_menu.dart';
import 'package:retail_mobile/presentation/widgets/common_date_picker.dart';
import 'package:retail_mobile/presentation/widgets/custom_payment_dialog.dart';
import 'package:retail_mobile/presentation/widgets/custom_svg.dart';
import 'package:retail_mobile/presentation/widgets/reward_dialog.dart';
import 'package:retail_mobile/state_management/state/floating_state.dart';

class BillScreen extends ConsumerStatefulWidget {
  const BillScreen({super.key});

  @override
  ConsumerState createState() => _BillScreenState();
}

class _BillScreenState extends ConsumerState<BillScreen>
    with SingleTickerProviderStateMixin {
  late AppAnimation appAnimation;
  final _searchController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    appAnimation = AppAnimation(vsync: this);
    appAnimation.controller.forward();
  }

  final List<PaymentMethod> paymentMethods = [
    PaymentMethod('Cash', 'money'),
    PaymentMethod('Google Pay', 'google_pay'),
    PaymentMethod('PhonePe', 'phonepe'),
    PaymentMethod('Paytm', 'paytm'),
    PaymentMethod('UPI', 'upi'),
    PaymentMethod('Amazon Pay', 'amazon_pay'),
    PaymentMethod('Other Cards', 'card'),
    PaymentMethod('Discount', 'discount'),
    PaymentMethod('Patty Cash', 'money'),
    PaymentMethod('Rewards', 'reward'),
    PaymentMethod('Coupon', 'coupon'),
    PaymentMethod('Advance Payment', 'money'),
  ];

  Future<void> _pickDate(BuildContext context) async {
    DateTime? dateTime = await DatePickerHelper.showDatePickerDialog(context);
    if (dateTime != null) {
      setState(() {
        _selectedDate = dateTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ref.watch(boolProvider).isExpanded) {
          ref.read(boolProvider.notifier).toggleExpanded();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryButtonColor,
              size: 18,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Bill',
            style: TextStyle(color: AppColors.primaryButtonColor),
          ),
          titleSpacing: -15,
          actions: [
            SizedBox(
              height: 25,
              width: 120,
              child: TextField(
                controller: _searchController,
                cursorHeight: 15,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Icon(
                      Icons.search,
                      size: 15,
                      color: AppColors.primaryButtonColor,
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  hintText: 'Customer Name/ Phone',
                  contentPadding: const EdgeInsets.only(left: 7, top: 0),
                  constraints: BoxConstraints(maxHeight: 35),
                  hintStyle: TextStyle(fontSize: 10),
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
            const SizedBox(
              width: 6,
            ),
            GestureDetector(
              onTap: () => _pickDate(context),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.veryLightGrey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(children: [
                  Icon(
                    Icons.calendar_month_rounded,
                    size: 15,
                    color: AppColors.primaryButtonColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    _selectedDate == null
                        ? 'Select Date'
                        : DateFormat('dd-MM-yyyy').format(_selectedDate!),
                    style: TextStyle(
                        color: _selectedDate == null
                            ? AppColors.veryLightGrey
                            : null),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            CustomSvg(name: 'plus_icon'),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: paymentMethods.length,
                    itemBuilder: (context, index) {
                      return PaymentMethodItem(
                          paymentMethod: paymentMethods[index]);
                    },
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bill No',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Bill No',
                            hintStyle: TextStyle(color: Color(0xFFCFCFCF)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            constraints: BoxConstraints(maxHeight: 35),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Count',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Count',
                            hintStyle: TextStyle(color: Color(0xFFCFCFCF)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            constraints: BoxConstraints(maxHeight: 35),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Interstate',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                                height: 20,
                                width: 20,
                                child: Checkbox(
                                  activeColor: AppColors.primaryButtonColor,
                                  side: BorderSide(
                                      color: AppColors.primaryButtonColor),
                                  value: false,
                                  onChanged: (value) {},
                                )),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Phone No',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Phone No',
                            hintStyle: TextStyle(color: Color(0xFFCFCFCF)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            constraints: BoxConstraints(maxHeight: 35),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'GSTIN',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter GSTIN No',
                            hintStyle: TextStyle(color: Color(0xFFCFCFCF)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            constraints: BoxConstraints(maxHeight: 35),
                          ),
                        ),
                        SizedBox(height: 16),
                        CartTotalAmountCard(
                          isViewBill: false,
                          controller: appAnimation.controller,
                          isBillSection: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ExpandableArrowMenu(
              animation: appAnimation.animation,
              horizontalMargin: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethod {
  final String name;
  final String iconName;

  PaymentMethod(this.name, this.iconName);
}

class PaymentMethodItem extends StatelessWidget {
  final PaymentMethod paymentMethod;

  const PaymentMethodItem({super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => (paymentMethod.name == 'Patty Cash')
              ? RewardDialog(
                  title: 'Patty Cash',
                )
              : (paymentMethod.name == 'Rewards')
                  ? RewardDialog(
                      title: 'Rewards',
                    )
                  : CustomPaymentDialog(
                      paymentMethod: paymentMethod.name,
                      amount: '263.0',
                    ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.veryLightGrey),
              ),
              child: (paymentMethod.iconName == 'paytm' ||
                      paymentMethod.iconName == 'amazon_pay' ||
                      paymentMethod.iconName == 'phonepe' ||
                      paymentMethod.iconName == 'upi' ||
                      paymentMethod.iconName == 'google_pay')
                  ? Image.asset(
                      'assets/images/${paymentMethod.iconName}.png',
                      width: 30,
                      height: 30,
                    )
                  : CustomSvg(
                      name: paymentMethod.iconName,
                      width: 30,
                      height: 30,
                      // color: AppColors.primaryButtonColor,
                    ),
            ),
            SizedBox(height: 4),
            Expanded(
              child: Text(
                paymentMethod.name,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: AppColors.veryLightGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
