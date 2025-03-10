import 'package:flutter/material.dart';

import 'display_book_image.dart';

class ListViewBooKImage extends StatelessWidget {
  const ListViewBooKImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) => const Padding(
      padding:  EdgeInsets.only(right: 8.0),
      child: DisplayBookImage(),
    ),itemCount: 10,scrollDirection: Axis.horizontal);
  }
}