
import 'package:bookly_app/main.dart';
import 'package:flutter/material.dart';

class CustomDisplayError extends StatelessWidget {
  const CustomDisplayError({
    super.key, required this.errorMessage,
  });
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage,style: themeApp.textStyle18(context).copyWith(color: themeApp.primaryColor),));
  }
}