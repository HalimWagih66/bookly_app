import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotItem extends StatelessWidget {
  const DotItem({super.key, required this.isCenter, required this.isActive});
  final bool isCenter;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isCenter?const EdgeInsets.symmetric(horizontal: 8):EdgeInsets.zero,
      child: Container(
        height: 6.h,
        width: 16.w,
        decoration: BoxDecoration(
            color:  isActive?const Color(0xff9098B1):Colors.white,
            borderRadius: BorderRadius.circular(7),
          border: Border.all(width: 0.7,color: Colors.grey,style: BorderStyle.solid)
        ),
      ),
    );
  }
}
