import 'package:bookly_app/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'custom_elevated_button.dart';
import 'list_dots.dart';

class FrameMovingPart extends StatelessWidget {
   FrameMovingPart({
    super.key,
    required this.pageController,
  });

  final PageController pageController;
  final themeApp = LightThemeApp();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomElevatedButton(
          onPressed: () {
            if (pageController.page?.round() != 2) {
              pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInToLinear);
            } else {

            }
          },
          background: const Color(0xff8599ff), child: Text("next",style: themeApp.textStyle14(context)),
        ),
        ListDots(currentPage: pageController.page?.round() ?? 0),
        TextButton(
          onPressed: () {

          },
          child: Text(
            "Skip",
            style:  themeApp.textStyle14(context),
          ),
        ),
      ],
    );
  }
}
