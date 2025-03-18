import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';

class CustomDeleteDialog extends StatelessWidget {
  final String title;
  final Function() onDelete;
  final bool? showAdditionalWarning;

  const CustomDeleteDialog({
    super.key,
    required this.title,
    required this.onDelete,
    this.showAdditionalWarning = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(image: AssetImage('assets/images/delete_image.png')),
            const SizedBox(height: 20),
            Text(
              "Do You Want To Delete",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Are You Sure You Want To Delete This $title. ${showAdditionalWarning! ? 'It Will Delete Corresponding Items Linkage Also' : ''}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  onDelete();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryButtonColor,
                  foregroundColor: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Delete",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example of how to use this widget:
void showDeleteConfirmationDialog(
    BuildContext context, String itemTitle, Function() onDeleteConfirmed,
    {bool? showWarning}) {
  showDialog(
    context: context,
    builder: (context) => CustomDeleteDialog(
      title: itemTitle,
      onDelete: onDeleteConfirmed,
      showAdditionalWarning: showWarning,
    ),
  );
}
