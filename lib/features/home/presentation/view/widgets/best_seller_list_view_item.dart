import 'package:bookly_app/features/home/presentation/view/widgets/display_book_image.dart';
import 'package:bookly_app/main.dart';
import 'package:flutter/material.dart';
import 'book_rating.dart';



class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            const DisplayBookImage(),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      'Harry Potter and the Goblet of Fire',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: themeApp.textStyle20(context).copyWith(
                        fontFamily: "kGtSectraFine",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                   Text(
                    'J.K. Rowling',
                    style: themeApp.textStyle14(context),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        '19.99 €',
                        style: themeApp.textStyle20(context).copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const BookRating(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
