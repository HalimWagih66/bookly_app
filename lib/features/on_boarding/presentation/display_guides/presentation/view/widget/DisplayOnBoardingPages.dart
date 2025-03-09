import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'on_boarding_moving_part.dart';
import 'frame_on_boarding_page_view_builder.dart';

class DisplayOnBoardingViewBody extends StatefulWidget {
  const DisplayOnBoardingViewBody({
    super.key,
  });
  @override
  State<DisplayOnBoardingViewBody> createState() => _DisplayOnBoardingViewBodyState();
}
class _DisplayOnBoardingViewBodyState extends State<DisplayOnBoardingViewBody> {
  PageController pageController = PageController();
  int currentPage = 0;
  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 60.h, left: 30.w, right: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: OnBoardingPageViewBuilder(pageController: pageController),
          ),
          Flexible(child: SizedBox(height: 106.h)),
          FrameMovingPart(pageController: pageController)
        ],
      ),
    );
  }
}
