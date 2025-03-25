import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';

class DownloadMainScreen extends StatelessWidget {
  const DownloadMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: AppColors.primaryButtonColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Download',
          style: TextStyle(
            color: AppColors.primaryButtonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMenuButton(
                "Configuration Screen Data",
                () {},
              ),
              const SizedBox(height: 12),
              _buildMenuButton(
                "Price & Stock",
                () {},
              ),
              const SizedBox(height: 12),
              _buildMenuButton(
                "Customer Data",
                () {},
              ),
              const SizedBox(height: 12),
              _buildMenuButton(
                "Supplier Details Data",
                () {},
              ),
              const SizedBox(height: 12),
              _buildMenuButton(
                "Item Master",
                () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDownloadButton() {
    return Row(
      children: [
        Icon(
          Icons.arrow_back_ios,
          size: 16,
          color: AppColors.primaryButtonColor,
        ),
        const SizedBox(width: 4),
        Text(
          "Download",
          style: TextStyle(
            color: AppColors.primaryButtonColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuButton(String text, void Function() onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primaryButtonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
