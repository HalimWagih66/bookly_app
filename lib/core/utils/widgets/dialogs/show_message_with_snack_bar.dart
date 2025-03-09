import 'package:flutter/material.dart';
import '../../../../main.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessageWithSnackBar({required Color background,required String message,required BuildContext context}){
   return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
       backgroundColor: background,
       duration: const Duration(seconds: 5),
       content: Text(message,style: themeApp.textStyle18(context).copyWith(color: themeApp.secondColor)),
     ),
   );
}