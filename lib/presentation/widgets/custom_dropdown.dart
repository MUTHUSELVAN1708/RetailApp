import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';

class CustomDropdown extends StatefulWidget {
  final String title;
  final List<String> dropdownItems;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.title,
    required this.dropdownItems,
    this.selectedValue,
    required this.onChanged,
  });

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Text(
          widget.title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 7),
        Container(
          height: 38,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGrey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.lightGrey,
            ),
            borderRadius: BorderRadius.circular(10),
            dropdownColor: const Color(0xFFFFEDF0),
            isExpanded: true,
            hint: Text(
              widget.title,
              style: const TextStyle(color: AppColors.lightGrey),
            ),
            underline: const SizedBox(),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue;
              });
              widget.onChanged(newValue);
            },
            items: widget.dropdownItems.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  // style: const TextStyle( color: Color(0xFFB64D61)),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
