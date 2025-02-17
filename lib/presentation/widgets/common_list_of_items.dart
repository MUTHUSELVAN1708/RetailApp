import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retail_mobile/config/app_colors.dart';
import 'package:retail_mobile/presentation/widgets/custom_svg.dart';
import 'package:retail_mobile/state_management/state/floating_state.dart';

class CommonListOfItems extends ConsumerStatefulWidget {
  final List<Details> detailsList;
  final PageController? pageController;

  const CommonListOfItems(
      {super.key, required this.detailsList, this.pageController});

  @override
  ConsumerState<CommonListOfItems> createState() => _CommonListOfItemsState();
}

class _CommonListOfItemsState extends ConsumerState<CommonListOfItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.detailsList.length,
        itemBuilder: (context, index) {
          return handleList(widget.detailsList[index], index);
        },
      ),
    );
  }

  Widget handleList(Details settingsMethod, int index) {
    return GestureDetector(
      onTap: () {
        ref.read(boolProvider.notifier).pageIndex(index);
        if (widget.pageController != null) {
          widget.pageController?.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.veryLightGrey),
              ),
              child: CustomSvg(
                name: settingsMethod.iconName,
                width: 30,
                height: 30,
                color: AppColors.primaryButtonColor,
              ),
            ),
            SizedBox(height: 6),
            Text(
              settingsMethod.name,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: AppColors.veryLightGrey),
            ),
          ],
        ),
      ),
    );
  }
}

class Details {
  final String name;
  final String iconName;
  final Widget widget;

  Details(this.name, this.iconName, this.widget);
}
