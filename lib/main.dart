import 'package:flutter/material.dart';
import 'package:news_app/core/utils/constants.dart';
import 'package:news_app/core/utils/routes/router.dart';
import 'package:news_app/core/utils/routes/routes.dart';
import 'package:news_app/core/utils/themes/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: AppConstants.appName,
      theme: ThemeData(primaryColor: AppDarkColors.blackColor),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRoutes.home,
    );
  }
}
