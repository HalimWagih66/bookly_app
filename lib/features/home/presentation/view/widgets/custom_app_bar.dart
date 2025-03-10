import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../generated/assets.dart';

class CustomAppBarForHome extends StatelessWidget {
  const CustomAppBarForHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.imagesLogoApp,height: 18,),
        const Spacer(),
        IconButton(onPressed: () {

        }, icon: const Icon(
          color:Colors.white,
          FontAwesomeIcons.magnifyingGlass,
          size: 24,
        )
        ),
      ],
    );
  }
}
