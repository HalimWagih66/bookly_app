import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';



void showMessageWithAwesomeDialog({
    required BuildContext context,
    required String message,
    required DialogType dialogType,
    String? title,
    String? okActionName,
  void Function()? btnOkOnPress,
  void Function()? btnCancelOnPress,
  bool dismissOnTouchOutside = false,
    String? cancelActionName,
  }) {
    AwesomeDialog(
      dismissOnTouchOutside: dismissOnTouchOutside,
      dialogBackgroundColor: themeApp.secondColor,
      context: context,
      dialogType: dialogType,
      title: title,
      titleTextStyle: themeApp.textStyle18(context).copyWith(fontSize: 21),
      animType: AnimType.rightSlide,
      desc: message,
      descTextStyle: themeApp.textStyle18(context),
      btnCancelOnPress: btnCancelOnPress,
      btnOkOnPress: btnOkOnPress,
      btnOkText: okActionName,
      btnCancelText: cancelActionName,
    ).show();
}
