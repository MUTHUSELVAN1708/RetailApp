import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/common_image_widget.dart';
import 'package:retail_mobile/presentation/widgets/custom_delete_dialog.dart';
import 'package:retail_mobile/presentation/widgets/custom_dropdown.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class ConfigurationCategoryScreen extends StatefulWidget {
  const ConfigurationCategoryScreen({super.key});

  @override
  State<ConfigurationCategoryScreen> createState() =>
      _ConfigurationCategoryScreenState();
}

class _ConfigurationCategoryScreenState
    extends State<ConfigurationCategoryScreen> {
  final TextEditingController _categoryController = TextEditingController();
  final List<String> _departments = ['Sales', 'Manager', 'Accountant', 'Admin'];
  final List<Category> categories = [];
  File? _image;
  String? dept;
  String? base64String;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      base64String = await convertFileToBase64(File(image.path));
    }
  }

  Future<String> convertFileToBase64(File file) async {
    try {
      final bytes = await file.readAsBytes();
      return base64Encode(bytes);
    } catch (e) {
      print('Error reading file: $e');
      return '';
    }
  }

  void _addCategory() {
    if (_categoryController.text.isNotEmpty && dept != null) {
      setState(() {
        categories.add(Category(
            id: (categories.length + 1).toString(),
            name: _categoryController.text,
            dept: dept!,
            image: base64String));
        _categoryController.clear();
        dept = null;
        base64String = null;
        _image = null;
      });
    }
  }

  void _deleteCategory(int index) {
    setState(() {
      categories.removeAt(index);
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
            label: 'Category Name',
            hintText: 'Enter Category Name',
            controller: _categoryController,
          ),
          CustomDropdown(
            onChanged: (value) {
              setState(() {
                dept = value;
              });
            },
            title: 'Department Name',
            dropdownItems: _departments,
            selectedValue: dept,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Image Upload',
            style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 15,
                fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 10,
          ),
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
                            child: CommonImageWidget(imageName: 'upload')),
                    const SizedBox(height: 10),
                    Text(
                      'Category Image',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 5),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.primaryButtonColor),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Text('Browse Files')),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryButtonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minimumSize: Size(double.infinity, 38),
            ),
            onPressed: () {
              _addCategory();
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
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: categories.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return CategoryItem(
                  category: categories[index],
                  onDelete: () => _deleteCategory(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;
  final VoidCallback onDelete;

  const CategoryItem({
    super.key,
    required this.category,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: category.image != null
                    ? DecorationImage(
                        image: MemoryImage(base64Decode(category.image!)),
                        fit: BoxFit.cover)
                    : null),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Category Name : ${category.name}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Department Name : ${category.dept}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 20,
              child: Icon(Icons.edit,
                  color: AppColors.primaryButtonColor, size: 20),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => CustomDeleteDialog(
                  title: 'Category',
                  onDelete: onDelete,
                  showAdditionalWarning: true,
                ),
              );
            },
            child: SizedBox(
              width: 20,
              child: Icon(Icons.delete,
                  color: AppColors.primaryButtonColor, size: 20),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

class Category {
  final String name;
  final String id;
  final String dept;
  final String? image;

  Category(
      {required this.name, required this.id, required this.dept, this.image});
}
