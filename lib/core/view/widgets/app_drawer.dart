import 'package:flutter/material.dart';
import 'package:news_app/core/utils/themes/dark_theme.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppDarkColors.deepNavyBlack,
      elevation: 0.0,
      width: 200,

      child: Column(children: [

      ],),
    );
  }
}
