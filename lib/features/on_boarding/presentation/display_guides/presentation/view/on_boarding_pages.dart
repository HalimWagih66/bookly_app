import 'package:bookly_app/features/on_boarding/presentation/display_guides/presentation/view/widget/DisplayOnBoardingPages.dart';
import 'package:flutter/material.dart';

class OnBoardingPages extends StatelessWidget {
  const OnBoardingPages({super.key});
  static const routeName = "/";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: DisplayOnBoardingViewBody(),
    );
  }
}
