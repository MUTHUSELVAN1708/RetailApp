import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/state_management/state/floating_state.dart';

class ExpandableArrowMenu extends ConsumerWidget {
  final Animation<Offset> animation;
  final bool isCart;

  const ExpandableArrowMenu(
      {super.key, required this.animation, required this.isCart});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: isCart ? 15 : 30, vertical: 60),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (ref.watch(boolProvider).isExpanded)
                SlideTransition(
                  position: animation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildMenuItem('Clear', () {}),
                      _buildMenuItem('Hold/Resume Bill', () {}),
                      _buildMenuItem('Void Bill', () {}),
                      _buildMenuItem('Advance Payment', () {}),
                      _buildMenuItem('View Advance Payment', () {}),
                      _buildMenuItem('View Bill', () {}),
                      _buildMenuItem('Print Token', () {}),
                      _buildMenuItem('Save Bill', () {}),
                      _buildMenuItem('Print Bill', () {}),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, void Function() onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
            color: Color(0xFFECECEC), borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style: TextStyle(color: AppColors.primaryButtonColor),
        ),
      ),
    );
  }
}
