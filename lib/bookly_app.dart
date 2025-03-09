import 'package:bookly_app/on_boarding/presentation/display_guides/presentation/view/on_boarding_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(333, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          OnBoardingPages.routeName: (context) => const OnBoardingPages(),

        },
        initialRoute: OnBoardingPages.routeName,
      ),
    );
  }
}