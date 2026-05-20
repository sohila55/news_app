import 'package:flutter/material.dart';
import 'package:news_app/core/utils/constants.dart';
import 'package:news_app/core/utils/routes/router.dart';
import 'package:news_app/core/utils/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRoutes.home,
    );
  }
}
