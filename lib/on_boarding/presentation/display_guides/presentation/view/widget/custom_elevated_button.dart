import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.onPressed, required this.background, required this.child});
  final void Function() onPressed;
  final Color background;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 13.w),
            backgroundColor: background
        ),
        child: child);
  }
}
