import 'package:flutter/material.dart';
import 'best_seller_list_view.dart';
import '../../../../../main.dart';
import 'custom_app_bar.dart';
import 'list_view_book_image.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 13.0,left: 13,top: 8),
      child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: CustomAppBarForHome()),
             const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.34,
                  child: const ListViewBooKImage()
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 50)),
            SliverToBoxAdapter(child: Text("Best Seller",style: themeApp.textStyle16(context),)),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            const BestSellerListView()
          ],
        ),
    );
  }
}
