import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';

class UsersListScreen extends StatelessWidget {
  final List<Map<String, String>> users = List.generate(
    6,
    (index) => {
      "name": "Admin",
      "role": "Manager",
      "status": "Active",
    },
  );

  UsersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryButtonColor,
            )),
        title: Text("Users List History",
            style: TextStyle(color: AppColors.primaryButtonColor)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.red),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 12, top: 12, bottom: 12, right: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildRow(
                          'Name',
                          users[index]['name'] ?? '',
                        ),
                        _buildRow(
                          'Role',
                          users[index]['role'] ?? '',
                        ),
                        _buildRow(
                          'Status',
                          users[index]['status'] ?? '',
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 20,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 10,
                          width: 30,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: AppColors.primaryButtonColor,
                              size: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          width: 30,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete_forever,
                              color: AppColors.primaryButtonColor,
                              size: 20,
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
