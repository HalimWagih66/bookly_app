import 'package:bookly_app/generated/assets.dart';
import 'package:flutter/material.dart';

import '../../../model/frame_on_boarding_model.dart';
import 'on_boarding_page.dart';

class OnBoardingPageViewBuilder extends StatelessWidget {
  const OnBoardingPageViewBuilder({
    super.key,
    required this.pageController,
  });

  final PageController pageController;
  final List<OnBoardingPageModel> items = const [
    OnBoardingPageModel(
        image: Assets.imagesOnBoardingImage1,
        title: "Start now",
        desc: "Embark on your journey with books!"),
    OnBoardingPageModel(
        image: Assets.imagesOnBoardingImage2,
        title: "A world of books at your fingertips!",
        desc: "Discover thousands of books in various fields, ready to read at any time."),
    OnBoardingPageModel(
        image: Assets.imagesOnBoardingImage3,
        title: "Books to suit your taste",
        desc:
        "Get personalized recommendations based on your interests and favorite books."),
  ];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) => OnBoardingPage(onBoardingModel: items[index],),
        itemCount: items.length
    );
  }
}