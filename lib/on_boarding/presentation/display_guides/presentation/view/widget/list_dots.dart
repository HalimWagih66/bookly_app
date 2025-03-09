import 'package:flutter/material.dart';

import 'dot_item.dart';

class ListDots extends StatelessWidget {
  const ListDots({
    super.key, required this.currentPage,});
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) => DotItem(isCenter:index == 1, isActive: index == currentPage),).toList(),
    );
  }
}