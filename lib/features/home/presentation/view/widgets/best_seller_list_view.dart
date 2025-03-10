import 'package:flutter/material.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
        return SliverList.builder(itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: BookListViewItem(),
        ),itemCount: 10,);
  }
}

