import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CompanyDetailsForm extends StatefulWidget {
  const CompanyDetailsForm({super.key});

  @override
  State<CompanyDetailsForm> createState() => _CompanyDetailsFormState();
}

class _CompanyDetailsFormState extends State<CompanyDetailsForm> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                const Text(
                  'Add Company Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Image Picker Section
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      _image != null
                          ? Image.file(
                              _image!,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.business,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: _pickImage,
                        child: const Text('Browse Files'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                    'First Name', 'Enter Your First Name', (value) {}),
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
                _buildTextField('Device Name', 'Enter Device Name', (value) {}),

                const SizedBox(height: 20),

                // Continue Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
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
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
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
    );
  }
}
