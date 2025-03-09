import 'package:bookly_app/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import '../../../model/frame_on_boarding_model.dart';

class OnBoardingPage extends StatelessWidget {
   OnBoardingPage({
    super.key, required this.onBoardingModel,
  });
  final OnBoardingPageModel onBoardingModel;
  final themeApp = LightThemeApp();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
            child: AspectRatio(aspectRatio: 290 / 380,
        child: Image.asset(onBoardingModel.image))),
        const SizedBox(height: 25),
        Text(onBoardingModel.title,style: themeApp.textStyle18(context)),
        const SizedBox(height: 17),
        Text(onBoardingModel.desc,style:  themeApp.textStyle14(context),textAlign: TextAlign.center),
      ],
    );
  }
}