import 'package:flutter/material.dart';

class CustomTextFieldWithTitle extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final void Function(String)? onChanged;
  final TextInputType? inputType;
  final bool? readOnly;

  const CustomTextFieldWithTitle({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.onChanged,
    this.inputType,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            keyboardType: inputType ?? TextInputType.text,
            readOnly: readOnly!,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              hintStyle: const TextStyle(color: Color(0xFFCFCFCF)),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              constraints: const BoxConstraints(maxHeight: 35),
            ),
            onChanged: (value) {
              if (onChanged != null) {
                onChanged!(value);
              }
            },
          ),
        ],
      ),
    );
  }
}
