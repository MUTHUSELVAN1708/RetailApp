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
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // widget.pageController?.addListener(() {
    //   int newIndex = widget.pageController!.page!.round();
    //   ref.read(boolProvider.notifier).pageIndex(newIndex);
    //   _scrollToIndex(newIndex);
    // });
  }

  // void _scrollToIndex(int index) {
  //   double scrollPosition = index * 80.0;
  //   _scrollController.animateTo(
  //     scrollPosition,
  //     duration: Duration(milliseconds: 300),
  //     curve: Curves.easeInOut,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 90,
      child: ListView.builder(
        controller: _scrollController, // Attach the scroll controller
        scrollDirection: Axis.horizontal,
        itemCount: widget.detailsList.length,
        itemBuilder: (context, index) {
          return handleList(widget.detailsList[index], index);
        },
      ),
    );
  }

  Widget handleList(Details settingsMethod, int index) {
    final boolState = ref.watch(boolProvider);
    return GestureDetector(
      onTap: () {
        ref.read(boolProvider.notifier).pageIndex(index);
        widget.pageController?.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
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
                border: Border.all(
                    color: boolState.settingsPageIndex == index
                        ? AppColors.primaryButtonColor
                        : AppColors.veryLightGrey),
              ),
              child: CustomSvg(
                name: settingsMethod.iconName,
                width: 30,
                height: 30,
                color: boolState.settingsPageIndex == index
                    ? AppColors.primaryButtonColor
                    : AppColors.veryLightGrey,
              ),
            ),
            SizedBox(height: 6),
            Text(
              settingsMethod.name,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  color: boolState.settingsPageIndex == index
                      ? AppColors.primaryButtonColor
                      : AppColors.veryLightGrey),
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
