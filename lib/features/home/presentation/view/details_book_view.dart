import 'package:bookly_app/features/home/presentation/view/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class DetailsBookView extends StatelessWidget {
  const DetailsBookView({super.key});
  static const routeName = "/DetailsBookView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: BookDetailsViewBody(),
    );
  }
}