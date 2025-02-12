import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/screens/cart/bill_list_screen.dart';
import 'package:retail_mobile/presentation/screens/cart/cart_total_amount_card.dart';
import 'package:retail_mobile/presentation/screens/cart/expandable_arrow_menu.dart';

class ViewBillScreen extends ConsumerStatefulWidget {
  const ViewBillScreen({super.key});

  @override
  ConsumerState<ViewBillScreen> createState() => _ViewBillScreenState();
}

class _ViewBillScreenState extends ConsumerState<ViewBillScreen>
    with SingleTickerProviderStateMixin {
  DateTime? _selectedDate;
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
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'View Bill',
                          style: TextStyle(
                            color: AppColors.primaryButtonColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 4),
                        _buildTextField('Bill Number'),
                        _buildTextField('Bill Date',
                            icon: Icons.calendar_month_rounded),
                        _buildTextField('Customer Name',
                            initialValue: 'Will Jacks'),
                        _buildTextField('Phone No',
                            initialValue: '8906573410', enabled: true),
                        _buildTextField('Customer GSTIN',
                            initialValue: '8906573410', enabled: true),
                        const SizedBox(height: 10),
                        SizedBox(height: 250, child: BillListScreen()),
                        const SizedBox(height: 10),
                        CartTotalAmountCard(
                          isViewBill: true,
                          controller: _controller,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ExpandableArrowMenu(
            animation: _animation,
            isCart: false,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label,
      {String? initialValue, IconData? icon, bool enabled = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5),
        SizedBox(
          height: 30,
          child: label == 'Bill Date'
              ? GestureDetector(
                  onTap: () => _pickDate(context),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedDate == null
                              ? label
                              : DateFormat('dd-MM-yyyy').format(_selectedDate!),
                        ),
                        Icon(
                          icon,
                          size: 15,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                )
              : TextField(
                  cursorHeight: 15,
                  decoration: InputDecoration(
                    hintText: 'Enter $label',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey), // Light grey border
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  ),
                  controller: initialValue != null
                      ? TextEditingController(text: initialValue)
                      : null,
                  enabled: enabled,
                ),
        ),
      ],
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
