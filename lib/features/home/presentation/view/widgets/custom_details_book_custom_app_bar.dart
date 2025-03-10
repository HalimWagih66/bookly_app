import 'package:flutter/material.dart';

class CustomDetailsBookCustomAppBar extends StatelessWidget {
  const CustomDetailsBookCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.close,color: Colors.white,),
        Icon(Icons.shopping_cart,color: Colors.white)
      ],
    );
  }
}
