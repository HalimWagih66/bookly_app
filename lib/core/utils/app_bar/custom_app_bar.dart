import 'package:bookly_app/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
   CustomAppBar({super.key, this.leadingIconData, this.backgroundColor = Colors.transparent, required this.title, this.onPressed});
  final IconData? leadingIconData;
  final Color backgroundColor;
  final String title;
  final void Function()? onPressed;
  final themeApp = LightThemeApp();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      surfaceTintColor: backgroundColor,
      foregroundColor: backgroundColor,
      backgroundColor: backgroundColor,
      leading: leadingIconData == null?null:IconButton(icon: Icon(leadingIconData,color: themeApp.primaryColor,), onPressed: onPressed),
      title: Text(title,style: themeApp.textStyle18(context)),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 65);
}
