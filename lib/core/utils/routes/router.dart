///////////////////////////////////////////////////////////
// This file is used to manage all the routes in the application.
// It contains router Function onGenerateRoute which is used to generate the routes based on the route name.
// It also contains a class AppRoutes which is used to define all the route names in the application.
///////// //////////////////////////////////////////////////
//// Example usage:
//// MaterialApp(
////   onGenerateRoute: AppRouter.onGenerateRoute,
////   initialRoute: AppRoutes.home,
////   // other properties
//// )
//// This file is used to manage all the routes in the application.
//// It contains router Function onGenerateRoute which is used to generate the routes based on the route name.
//// It also contains a class AppRoutes which is used to define all the route names in the application.

import 'package:flutter/material.dart';
import 'package:news_app/core/utils/routes/routes.dart';
import 'package:news_app/features/home/views/pages/home.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => Home());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
