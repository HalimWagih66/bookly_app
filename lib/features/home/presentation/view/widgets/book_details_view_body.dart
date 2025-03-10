import 'package:bookly_app/features/home/presentation/view/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../../main.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_details_book_custom_app_bar.dart';
import 'display_book_image.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.only(right: 38.0,top: 38,left: 38),
            child: Column(
              children: [
                const CustomDetailsBookCustomAppBar(),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: const DisplayBookImage()
                ),
                const SizedBox(
                  height: 43,
                ),
                Text(
                  'The Jungle Book',
                  style: themeApp.textStyle30(context).copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Opacity(
                  opacity: .7,
                  child: Text(
                    'Rudyard Kipling',
                    style: themeApp.textStyle18(context).copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const BookRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(
                  height: 37,
                ),
                const BooksAction(),
                const Expanded(child: SizedBox(height: 50)),
                Align(alignment: Alignment.centerLeft,child: Text("You can also like",style: themeApp.textStyle14(context))),
                const SizedBox(height: 16),
                const SimilarBooksListView(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        )
      ]
    );
  }
}




