import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/config/common_texts.dart';
import 'package:retail_mobile/core/utils/validators.dart';
import 'package:retail_mobile/presentation/widgets/custom_button2.dart';
import 'package:retail_mobile/presentation/widgets/custom_dropdown.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class ConfigurationQuickAccessQty extends StatefulWidget {
  const ConfigurationQuickAccessQty({super.key});

  @override
  State createState() => ConfigurationQuickAccessQtyState();
}

class ConfigurationQuickAccessQtyState
    extends State<ConfigurationQuickAccessQty> {
  final List<ValueEntry> entries = [];
  final TextEditingController value1Controller = TextEditingController();
  final TextEditingController value2Controller = TextEditingController();
  final TextEditingController value3Controller = TextEditingController();
  final TextEditingController value4Controller = TextEditingController();
  String? selectedUOM;

  void _addEntry() {
    setState(() {
      entries.add(
        ValueEntry(
          value1: value1Controller.text.isEmpty ? '1.0' : value1Controller.text,
          value2: value2Controller.text.isEmpty ? '1.0' : value2Controller.text,
          value3: value3Controller.text.isEmpty ? '1.0' : value3Controller.text,
          value4: value4Controller.text.isEmpty ? '1.0' : value4Controller.text,
          uom: selectedUOM,
        ),
      );
    });
    _clearFields();
  }

  void _clearFields() {
    setState(() {
      value1Controller.clear();
      value2Controller.clear();
      value3Controller.clear();
      value4Controller.clear();
    });
  }

  void _deleteEntry(int index) {
    setState(() {
      entries.removeAt(index);
    });
  }

  void _editEntry(int index) {
    final entry = entries[index];
    value1Controller.text = entry.value1;
    value2Controller.text = entry.value2;
    value3Controller.text = entry.value3;
    value4Controller.text = entry.value4;
    selectedUOM = entry.uom;
    setState(() {
      entries.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFieldWithTitle(
            label: 'Value 1',
            hintText: '1 KGS',
            controller: value1Controller,
            inputType: TextInputType.number,
            inputFormatters: [
              Validators.decimalNumber(),
            ],
          ),
          CustomTextFieldWithTitle(
            label: 'Value 2',
            hintText: '0.5 KGS',
            controller: value2Controller,
            inputType: TextInputType.number,
            inputFormatters: [
              Validators.decimalNumber(),
            ],
          ),
          CustomTextFieldWithTitle(
            label: 'Value 3',
            hintText: '0.25 KGS',
            controller: value3Controller,
            inputType: TextInputType.number,
            inputFormatters: [
              Validators.decimalNumber(),
            ],
          ),
          CustomTextFieldWithTitle(
            label: 'Value 4',
            hintText: '0.01 Kgs',
            controller: value4Controller,
            inputType: TextInputType.number,
            inputFormatters: [
              Validators.decimalNumber(),
            ],
          ),
          CustomDropdown(
              title: 'UOM',
              dropdownItems: CommonTexts.uomUnits,
              selectedValue: selectedUOM,
              onChanged: (value) {
                setState(() {
                  selectedUOM = value;
                });
              }),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  child: CustomButton2(
                text: 'Update',
                isColor: false,
                onPressed: () {
                  _addEntry();
                },
              )),
              const SizedBox(width: 8),
              Expanded(
                  child: CustomButton2(
                text: 'Clear',
                isColor: false,
                onPressed: () {
                  _clearFields();
                },
              )),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryButtonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minimumSize: Size(double.infinity, 38),
            ),
            onPressed: () {
              _addEntry();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline_outlined,
                  color: AppColors.whiteColor,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text("Add",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];
                return Stack(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 12, top: 12, bottom: 12, right: 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildRow(
                              'value 1',
                              entry.value1,
                            ),
                            _buildRow(
                              'Value 2',
                              entry.value2,
                            ),
                            _buildRow(
                              'Value 3',
                              entry.value3,
                            ),
                            _buildRow(
                              'Value 4',
                              entry.value4,
                            ),
                            _buildRow(
                              'UOM',
                              Validators.getUomAbbreviation(entry.uom ?? ''),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 25,
                        right: 20,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 10,
                              width: 30,
                              child: GestureDetector(
                                onTap: () {
                                  _editEntry(index);
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: AppColors.primaryButtonColor,
                                  size: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                              width: 30,
                              child: GestureDetector(
                                onTap: () {
                                  _deleteEntry(index);
                                },
                                child: Icon(
                                  Icons.delete_forever,
                                  color: AppColors.primaryButtonColor,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          // Label section with fixed width
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // Colon
          const SizedBox(width: 8),
          const Text(
            ':',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          // Value
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ValueEntry {
  String value1;
  String value2;
  String value3;
  String value4;
  String? uom;

  ValueEntry({
    required this.value1,
    required this.value2,
    required this.value3,
    required this.value4,
    this.uom,
  });
}
