import 'package:flutter/material.dart';

class DisplayBookImage extends StatelessWidget {
  const DisplayBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.3/3,
      child: Container(
        alignment: Alignment.topRight,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

