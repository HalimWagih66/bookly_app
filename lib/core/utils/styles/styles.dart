import 'package:bookly_app/core/utils/styles/size_config.dart';
import 'package:flutter/material.dart';

abstract class ThemeApp{
     TextStyle textStyle18(BuildContext context);
     TextStyle textStyle20(BuildContext context);
     TextStyle textStyle30(BuildContext context);
     TextStyle textStyle14(BuildContext context);
     TextStyle textStyle16(BuildContext context);
     late Color primaryColor;
     late Color secondColor;
}

 class LightThemeApp implements ThemeApp{

  @override
  Color primaryColor = const Color(0xffffffff);

  @override
  Color secondColor =  const Color(0xff000000);

  @override
  TextStyle textStyle18(BuildContext context) {
    return TextStyle(
          fontSize: getResponsiveFontSize(context, fontSize: 18),
          fontWeight: FontWeight.w600,
          color: primaryColor
      );
    }
   @override
  TextStyle textStyle20(BuildContext context) {
    return TextStyle(
          fontSize: getResponsiveFontSize(context, fontSize: 20),
          fontWeight: FontWeight.normal,
        fontFamily: "GTSectra",
          color: primaryColor
      );
    }

    @override
  TextStyle textStyle30(BuildContext context) {
      return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 30),
        fontWeight: FontWeight.w900,
        color: primaryColor,
        fontFamily: "GTSectra",
        letterSpacing: 1.2,
      );
    }
   @override
  TextStyle textStyle14(BuildContext context) {
    return TextStyle(
          fontSize: getResponsiveFontSize(context, fontSize: 14),
          fontWeight: FontWeight.normal,
          color: primaryColor
      );
    }

    @override
  TextStyle textStyle16(BuildContext context) {
      return TextStyle(
          fontSize: getResponsiveFontSize(context, fontSize: 16),
          fontWeight: FontWeight.w500,
          color: primaryColor
  );
  }
  // sacleFactor
// responsive font size
// (min , max) fontsize
   double getResponsiveFontSize(context, {required double fontSize}) {
     double scaleFactor = getScaleFactor(context);
     double responsiveFontSize = fontSize * scaleFactor;

     double lowerLimit = fontSize * .8;
     double upperLimit = fontSize * 1.1;
     print("responsiveFontSize $responsiveFontSize");
     return responsiveFontSize.clamp(lowerLimit, upperLimit);
   }

   double getScaleFactor(context) {
     // var dispatcher = PlatformDispatcher.instance;
     // var physicalWidth = dispatcher.views.first.physicalSize.width;
     // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
     // double width = physicalWidth / devicePixelRatio;

     double width = MediaQuery.sizeOf(context).width;
     if (width < SizeConfig.tablet) {
       return width / 550;
     } else if (width < SizeConfig.desktop) {
       return width / 1000;
     } else {
       return width / 1920;
     }
   }
}

 TextStyle textStyle = const TextStyle();
