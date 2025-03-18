import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/custom_delete_dialog.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class ConfigurationBrandScreen extends StatefulWidget {
  const ConfigurationBrandScreen({super.key});

  @override
  State<ConfigurationBrandScreen> createState() =>
      _ConfigurationBrandScreenState();
}

class _ConfigurationBrandScreenState extends State<ConfigurationBrandScreen> {
  final TextEditingController _brandNameController = TextEditingController();
  final List<Brand> brands = [
    Brand(id: '1', name: 'Britania'),
    Brand(id: '2', name: 'Kissan'),
  ];

  void _addBrand() {
    if (_brandNameController.text.isNotEmpty) {
      setState(() {
        brands.add(Brand(
          id: (brands.length + 1).toString(),
          name: _brandNameController.text,
        ));
        _brandNameController.clear();
      });
    }
  }

  void _deleteBrand(int index) {
    setState(() {
      brands.removeAt(index);
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
            label: 'Brand Name',
            hintText: 'Enter Brand Name',
            controller: _brandNameController,
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
              _addBrand();
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
              itemCount: brands.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return BrandItem(
                  brand: brands[index],
                  onDelete: () => _deleteBrand(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BrandItem extends StatelessWidget {
  final Brand brand;
  final VoidCallback onDelete;

  const BrandItem({
    super.key,
    required this.brand,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Brand Name : ${brand.name}',
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
                  title: 'Brand',
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

class Brand {
  final String name;
  final String id;

  Brand({required this.name, required this.id});
}
