import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/custom_delete_dialog.dart';
import 'package:retail_mobile/presentation/widgets/custom_textfield_with_title.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({super.key});

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  final TextEditingController _departmentNameController =
      TextEditingController();
  final List<Department> _departments = [
    Department(id: '1', name: 'Sales'),
    Department(id: '2', name: 'Accountant'),
    Department(id: '3', name: 'Admin'),
    Department(id: '4', name: 'Manager'),
  ];

  void _addDepartment() {
    if (_departmentNameController.text.isNotEmpty) {
      setState(() {
        _departments.add(Department(
          id: (_departments.length + 1).toString(),
          name: _departmentNameController.text,
        ));
        _departmentNameController.clear();
      });
    }
  }

  void _deleteDepartment(int index) {
    setState(() {
      _departments.removeAt(index);
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
            label: 'Department Name',
            hintText: 'Enter Department Name',
            controller: _departmentNameController,
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
              _addDepartment();
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
              itemCount: _departments.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return DepartmentItem(
                  department: _departments[index],
                  onDelete: () => _deleteDepartment(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DepartmentItem extends StatelessWidget {
  final Department department;
  final VoidCallback onDelete;

  const DepartmentItem({
    super.key,
    required this.department,
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
                  'Department Name : ${department.name}',
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
                  title: 'Department',
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

class Department {
  final String name;
  final String id;

  Department({required this.name, required this.id});
}
