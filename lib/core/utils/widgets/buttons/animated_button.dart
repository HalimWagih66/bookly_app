import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';


class CustomAnimatedButton extends StatelessWidget {
  const CustomAnimatedButton({super.key, required this.pressEven, required this.text, required this.backgroundColor, required this.textStyle});
  final String text;
  final Color backgroundColor;
  final TextStyle textStyle;
  final void Function() pressEven;
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(onPress: pressEven,text: text,backgroundColor:backgroundColor,textStyle: textStyle);
  }
}