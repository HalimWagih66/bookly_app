import 'package:bookly_app/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserQuestionAboutRegistration extends StatelessWidget {
   UserQuestionAboutRegistration({super.key,
    required this.questionText,
    required this.actionText,
    required this.routeName, this.colorText});
  final String questionText;
  final String actionText;
  final Color? colorText;
  final String routeName;
  final themeApp = LightThemeApp();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(questionText, style: themeApp.textStyle14(context).copyWith(color: colorText)),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () {
            GoRouter.of(context).replace(routeName);
          },
          child: Text(actionText, style: themeApp.textStyle14(context).copyWith(fontWeight: FontWeight.w900,color: colorText)),
        )
      ],
    );
  }
}
