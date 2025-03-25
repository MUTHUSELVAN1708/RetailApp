import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:retail_mobile/config/app_colors.dart' show AppColors;

class DayEndScreen extends StatefulWidget {
  const DayEndScreen({super.key});

  @override
  State createState() => DayEndScreenState();
}

class DayEndScreenState extends State<DayEndScreen> {
  // Today's date
  final DateTime _today = DateTime.now();

  // Maximum selectable date (5 years from today)
  late final DateTime _maxDate;

  // Selected date (initially set to today)
  late DateTime _selectedDate;

  // Current month being displayed
  late DateTime _currentMonth;

  @override
  void initState() {
    super.initState();
    _maxDate = DateTime(_today.year + 5, _today.month, _today.day);
    _selectedDate = _today;
    _currentMonth = DateTime(_today.year, _today.month);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFFB01A2E)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Day End',
          style: TextStyle(color: Color(0xFFB01A2E)),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Current Transaction Date Is ${DateFormat('dd-MM-yyyy').format(_today)}',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Text(
                  'Select Next Transaction Date',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          _buildCalendarHeader(),
          const SizedBox(
            height: 5,
          ),
          _buildCalendar(),
          Container(
            width: 30,
            height: 3,
            decoration: BoxDecoration(
                color: Color(0xFFFF8EA3),
                borderRadius: BorderRadius.circular(10)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // print(
                //     'Selected date: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryButtonColor,
                minimumSize: Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Set',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              DateTime previousMonth =
                  DateTime(_currentMonth.year, _currentMonth.month - 1);
              if (previousMonth.year > _today.year ||
                  (previousMonth.year == _today.year &&
                      previousMonth.month >= _today.month)) {
                setState(() {
                  _currentMonth = previousMonth;
                });
              }
            },
          ),
          Column(
            children: [
              Text(
                DateFormat('MMMM yyyy').format(_currentMonth),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat('E').format(_selectedDate).toUpperCase(),
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: () {
              DateTime nextMonth =
                  DateTime(_currentMonth.year, _currentMonth.month + 1);
              if (nextMonth.year < _maxDate.year ||
                  (nextMonth.year == _maxDate.year &&
                      nextMonth.month <= _maxDate.month)) {
                setState(() {
                  _currentMonth = nextMonth;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildWeekdayHeader(),
          SizedBox(height: 8),
          _buildCalendarDays(),
        ],
      ),
    );
  }

  Widget _buildWeekdayHeader() {
    final weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: weekdays
          .map((day) => Container(
                width: 40,
                alignment: Alignment.center,
                child: Text(
                  day,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildCalendarDays() {
    List<Widget> days = [];

    // Calculate the first day of the month
    DateTime firstDay = DateTime(_currentMonth.year, _currentMonth.month, 1);

    // Calculate the last day of the month
    DateTime lastDay = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);

    // Calculate the number of days to display from the previous month
    int daysInPreviousMonth = (firstDay.weekday - 1) % 7;

    // Add previous month's days
    DateTime prevMonth =
        DateTime(_currentMonth.year, _currentMonth.month - 1, 0);
    for (int i = 0; i < daysInPreviousMonth; i++) {
      days.add(_buildDayCell(prevMonth.day - daysInPreviousMonth + i + 1,
          isGrayed: true, isDisabled: true));
    }

    // Add current month's days
    for (int i = 1; i <= lastDay.day; i++) {
      DateTime dayDate = DateTime(_currentMonth.year, _currentMonth.month, i);

      bool isSelected = _selectedDate.year == dayDate.year &&
          _selectedDate.month == dayDate.month &&
          _selectedDate.day == dayDate.day;

      // Check if the date is selectable (today or later, and before max date)
      bool isDisabled = dayDate.isBefore(_today) || dayDate.isAfter(_maxDate);

      days.add(_buildDayCell(i,
          isGrayed: false,
          isSelected: isSelected,
          isDisabled: isDisabled,
          date: dayDate));
    }

    // Add next month's days to complete the grid
    int remainingDays = 42 - days.length; // 6 rows * 7 columns = 42 cells
    for (int i = 1; i <= remainingDays; i++) {
      days.add(_buildDayCell(i, isGrayed: true, isDisabled: true));
    }

    // Arrange days in rows
    List<Widget> rows = [];
    for (int i = 0; i < days.length; i += 7) {
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: days.sublist(i, i + 7),
        ),
      );
    }

    return Column(
      children: rows
          .map((row) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: row,
              ))
          .toList(),
    );
  }

  Widget _buildDayCell(int day,
      {bool isGrayed = false,
      bool isSelected = false,
      bool isDisabled = false,
      DateTime? date}) {
    return GestureDetector(
      onTap: isDisabled
          ? null
          : () {
              if (date != null) {
                setState(() {
                  _selectedDate = date;
                });
              }
            },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFB01A2E) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          day.toString(),
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : isDisabled
                    ? Colors.grey[300]
                    : isGrayed
                        ? Colors.grey[400]
                        : Colors.black,
          ),
        ),
      ),
    );
  }
}
