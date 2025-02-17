import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'dart:io';

import 'package:retail_mobile/presentation/widgets/common_image_widget.dart';

class AddStoreDetails extends StatefulWidget {
  final bool isEdit;

  const AddStoreDetails({super.key, this.isEdit = false});

  @override
  State<AddStoreDetails> createState() => _AddStoreDetailsState();
}

class _AddStoreDetailsState extends State<AddStoreDetails> {
  File? _image;
  final _formKey = GlobalKey<FormState>();

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (!widget.isEdit) ...[
                    const Text(
                      'Add Company Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryButtonColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                  DottedBorder(
                    color: AppColors.primaryButtonColor,
                    strokeWidth: 1.5,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [8, 4],
                    child: GestureDetector(
                      onTap: () {
                        _pickImage();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            _image != null
                                ? Image.file(
                                    _image!,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child:
                                        CommonImageWidget(imageName: 'upload')),
                            const SizedBox(height: 10),
                            Text(
                              'Store Logo',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryButtonColor),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Text('Browse Files')),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                      'Firm Name', 'Enter Your Firm Name', (value) {}),
                  _buildTextField('GSTIN', 'Enter Your GSTIN', (value) {}),
                  _buildTextField(
                      'Phone Number', 'Enter Your Phone Number', (value) {}),
                  _buildTextField('E-Mail', 'Enter Your Email', (value) {}),
                  _buildTextField('Address', 'Enter Your Address', (value) {}),
                  _buildTextField('City', 'Enter Your City', (value) {}),
                  _buildTextField('POS', 'Enter Your POS', (value) {}),
                  _buildTextField(
                      'Device ID', 'Enter Your Device ID', (value) {}),
                  _buildTextField('Store Group Name',
                      'Enter Your Store Group Name', (value) {}),
                  _buildTextField('Store Name', 'Enter Store Name', (value) {}),
                  _buildTextField(
                      'Device Name', 'Enter Device Name', (value) {}),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryButtonColor,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      widget.isEdit ? 'Update' : 'Continue',
                      style:
                          TextStyle(color: AppColors.whiteColor, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, String hint, Function(String)? onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $label';
              }
              return null;
            },
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
