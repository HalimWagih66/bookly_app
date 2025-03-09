import 'package:bookly_app/core/utils/styles/styles.dart';
import 'package:bookly_app/features/auth/sign_up/presentation/view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
              GoRouter.of(context).go(SignUpView.routeName);
            }
          },
          background: const Color(0xff8599ff), child: Text("next",style: themeApp.textStyle14(context)),
        ),
        ListDots(currentPage: pageController.page?.round() ?? 0),
        TextButton(
          onPressed: () {
            GoRouter.of(context).pushReplacementNamed(SignUpView.routeName);
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
