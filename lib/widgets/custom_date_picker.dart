import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDOBPicker extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateChanged;

  const CustomDOBPicker({
    super.key,
    required this.initialDate,
    required this.onDateChanged,
  });

  @override
  State<CustomDOBPicker> createState() => _CustomDOBPickerState();
}

class _CustomDOBPickerState extends State<CustomDOBPicker> {
  late int selectedYear;
  late int selectedMonth;
  late int selectedDay;

  final List<String> months = const [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  @override
  void initState() {
    super.initState();
    selectedYear = widget.initialDate.year;
    selectedMonth = widget.initialDate.month;
    selectedDay = widget.initialDate.day;
  }

  List<int> _getDaysInMonth(int year, int month) {
    final lastDay = DateTime(year, month + 1, 0).day;
    return List<int>.generate(lastDay, (i) => i + 1);
  }

  void _updateDate() {
    final newDate = DateTime(selectedYear, selectedMonth, selectedDay);
    widget.onDateChanged(newDate);
  }

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    final years = List<int>.generate(120, (i) => currentYear - i); // last 120 years
    final days = _getDaysInMonth(selectedYear, selectedMonth);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Month Picker
        _buildPicker(
          width: 130,
          initial: selectedMonth - 1,
          items: months,
          onSelected: (index) {
            setState(() {
              selectedMonth = index + 1;
              if (selectedDay > _getDaysInMonth(selectedYear, selectedMonth).length) {
                selectedDay = _getDaysInMonth(selectedYear, selectedMonth).length;
              }
              _updateDate();
            });
          },
        ),

        const SizedBox(width: 16),

        // Day Picker
        _buildPicker(
          width: 70,
          initial: selectedDay - 1,
          items: days.map((d) => d.toString()).toList(),
          onSelected: (index) {
            setState(() {
              selectedDay = days[index];
              _updateDate();
            });
          },
        ),

        const SizedBox(width: 16),

        // Year Picker
        _buildPicker(
          width: 90,
          initial: years.indexOf(selectedYear),
          items: years.map((y) => y.toString()).toList(),
          onSelected: (index) {
            setState(() {
              selectedYear = years[index];
              if (selectedDay > _getDaysInMonth(selectedYear, selectedMonth).length) {
                selectedDay = _getDaysInMonth(selectedYear, selectedMonth).length;
              }
              _updateDate();
            });
          },
        ),
      ],
    );
  }

  Widget _buildPicker({
    required double width,
    required int initial,
    required List<String> items,
    required ValueChanged<int> onSelected,
  }) {
    return SizedBox(
      height: 200,
      width: width,
      child: CupertinoPicker(
        scrollController: FixedExtentScrollController(initialItem: initial),
        itemExtent: 60,
        onSelectedItemChanged: onSelected,
        children: items.map((item) => Center(child: Text(item))).toList(),
      ),
    );
  }
}
