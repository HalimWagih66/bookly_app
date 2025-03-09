import 'package:flutter/material.dart';
import '../../../../main.dart';

class CustomDisplayItemsIsEmpty extends StatelessWidget {
  const CustomDisplayItemsIsEmpty({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.menu,size: 50,color: Colors.grey,),
        const SizedBox(height: 10),
        Text("There are no $title yet. Add a $title.",style: themeApp.textStyle18(context).copyWith(color: Colors.grey),textAlign: TextAlign.center,)
      ],
    );
  }
}