import 'package:flutter/material.dart';

import 'display_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height:MediaQuery.of(context).size.height*0.199 ,child: ListView.builder(itemBuilder: (context, index) => const Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: DisplayBookImage(),
    ),itemCount: 15,scrollDirection: Axis.horizontal,));
  }
}