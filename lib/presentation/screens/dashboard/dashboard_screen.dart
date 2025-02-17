import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/common_date_picker.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  DateTime? _fromDate;
  DateTime? _toDate;

  Future<void> _pickDate(BuildContext context, bool isFrom) async {
    DateTime? dateTime = await DatePickerHelper.showDatePickerDialog(context,
        firstDate: isFrom ? null : _fromDate,
        initialDate: isFrom ? _fromDate : _toDate);
    if (dateTime != null) {
      setState(() {
        if (isFrom) {
          _fromDate = dateTime;
        } else {
          _toDate = dateTime;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),

              // Sales Summary Section
              _buildSalesSummary(),
              const SizedBox(height: 20),

              // Top 10 Sold Items Section
              // _buildTopSoldItems(),
              TopSoldItemsSection(),
              const SizedBox(height: 20),

              // Purchase Summary Section
              _buildPurchaseSummary(),
              const SizedBox(height: 20),
              TopSoldItemsSection(),
              const SizedBox(height: 20),
              // Transaction Summary Section
              // _buildTransactionSummary(),
              TransactionSummary()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'DASHBOARD',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryButtonColor),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                _pickDate(context, true);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xFFCFCFCF))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _fromDate == null
                          ? 'From Date'
                          : DateFormat('dd-MM-yyyy').format(_fromDate!),
                      style: TextStyle(
                          color: _fromDate == null
                              ? Color(0xFFCFCFCF)
                              : AppColors.secondaryColor),
                    ),
                    Icon(
                      Icons.calendar_month_rounded,
                      color: Color(0xFFCFCFCF),
                      size: 18,
                    )
                  ],
                ),
              ),
            )),
            const SizedBox(width: 10),
            Expanded(
                child: GestureDetector(
              onTap: () {
                if (_fromDate != null) {
                  _pickDate(context, false);
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xFFCFCFCF))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _toDate == null
                          ? 'To Date'
                          : DateFormat('dd-MM-yyyy').format(_toDate!),
                      style: TextStyle(
                          color: _toDate == null
                              ? Color(0xFFCFCFCF)
                              : AppColors.secondaryColor),
                    ),
                    Icon(
                      Icons.calendar_month_rounded,
                      color: Color(0xFFCFCFCF),
                      size: 18,
                    )
                  ],
                ),
              ),
            )),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primaryButtonColor),
                child: Icon(
                  Icons.search,
                  color: AppColors.whiteColor,
                  size: 20,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildSalesSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'SALES SUMMARY',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryButtonColor),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFCFCFCF)),
          ),
          child: Row(
            children: [
              _buildSummaryCard('Sales Revenue', '1234.00',
                  AppColors.primaryButtonColor, false),
              _buildSummaryCard('Average Sales Per Bill', '234.50',
                  AppColors.primaryButtonColor, true),
              _buildSummaryCard(
                  'Total Bills', '150', AppColors.primaryButtonColor, false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(
      String title, String value, Color color, bool isDivider) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 8, top: 8, bottom: 4),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.symmetric(
                vertical: BorderSide(
                    color:
                        isDivider ? Color(0xFFCFCFCF) : AppColors.whiteColor))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF3C3C3C),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalBarItem(String name, String value, double percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(name),
              ),
              Text(value),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: percentage,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red[700]!),
          ),
        ],
      ),
    );
  }

  Widget _buildPurchaseSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'PURCHASE SUMMARY',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryButtonColor),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFCFCFCF)),
          ),
          child: Row(
            children: [
              _buildSummaryCard('Total Suppliers', '1234.00',
                  AppColors.primaryButtonColor, false),
              _buildSummaryCard('No of Invoices', '1234.00',
                  AppColors.primaryButtonColor, true),
              _buildSummaryCard('Total Purchase', '1234.00',
                  AppColors.primaryButtonColor, false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'AMOUNT TRANSACTION SUMMARY',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildTransactionCard('Cash', '450', Colors.yellow),
              _buildTransactionCard('Card', '450', Colors.blue),
              _buildTransactionCard('UPI', '450', Colors.green),
              _buildTransactionCard('Bank Transfer', '450', Colors.purple),
              _buildTransactionCard('Group Pay', '450', Colors.orange),
              _buildTransactionCard('Advance Payment', '450', Colors.pink),
              _buildTransactionCard('Process', '450', Colors.teal),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionCard(String title, String value, Color color) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopSoldItemsSection extends StatelessWidget {
  const TopSoldItemsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'TOP #10 SOLD ITEMS',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Row(
                  children: [
                    Text(
                      'UOM',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              // Calculate progress value based on index (reverse order)
              double progress = 1.0 - (index * 0.1);
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        // Background track
                        Container(
                          height: 2,
                          color: Colors.grey.shade200,
                        ),
                        // Progress bar
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width *
                              progress *
                              0.7,
                          color: Colors.red.shade400,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '#1 Carrots',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Text(
                          '1234.00',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red.shade400,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TransactionSummary extends StatelessWidget {
  TransactionSummary({super.key});

  final List<Map<String, dynamic>> transactions = [
    {'name': 'Cash', 'amount': 0},
    {'name': 'Card', 'amount': 0},
    {'name': 'Pettycash', 'amount': 0},
    {'name': 'Coupon', 'amount': 0},
    {'name': 'Advance Payment', 'amount': 0},
    {'name': 'Paytm', 'amount': 60},
    {'name': 'UPI', 'amount': 70},
    {'name': 'Amazon Pay', 'amount': 80},
    {'name': 'Google Pay', 'amount': 90},
    {'name': 'PhonePe', 'amount': 100},
  ];

  final List<Map<String, dynamic>> color = [
    {'color': Color(0xFFF67676)},
    {'color': Color(0xFFF0E720)},
    {'color': Color(0xFF2AEB9E)},
    {'color': Color(0xFF8B9AFE)},
    {'color': Color(0xFFDA36B6)},
    {'color': Color(0xFFFF5997)},
    {'color': Color(0xFFFFBD30)},
    {'color': Color(0xFFF1F278)},
    {'color': Color(0xFF37C179)},
    {'color': Color(0xFF23DFF2)},
  ];

  @override
  Widget build(BuildContext context) {
    double totalAmount =
        transactions.fold(0, (sum, item) => sum + item['amount']);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'AMOUNT TRANSACTION SUMMARY',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryButtonColor,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFECECEC)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 24,
                child: Row(
                  children: transactions.map((transaction) {
                    double percentage =
                        (transaction['amount'] / totalAmount) * 100;
                    int dynamicFlex = percentage.toInt();
                    int minFlex = 10;
                    int finalFlex = dynamicFlex + minFlex;

                    Color boxColor =
                        color[transactions.indexOf(transaction)]['color'];

                    return Expanded(
                      flex: finalFlex,
                      child: Container(
                        margin: const EdgeInsets.all(0.5),
                        color: boxColor,
                        child: Center(
                          child: Text(
                            '${percentage.toInt()}%',
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 8),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                  child: Column(
                    children: transactions
                        .sublist(0, 5)
                        .map((transaction) => _buildTransactionRow(
                            transaction['name'],
                            transaction['amount'],
                            Colors.pink))
                        .toList(),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    children: transactions
                        .sublist(5, 10)
                        .map((transaction) => _buildTransactionRow(
                            transaction['name'],
                            transaction['amount'],
                            Colors.pink))
                        .toList(),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionRow(String name, int amount, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: Color(0xFFF67676),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            ' : ',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            amount.toString(),
            style: TextStyle(
              color: Color(0xFF3C3C3C),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
