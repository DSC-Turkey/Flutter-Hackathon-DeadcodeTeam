import 'package:flutter/material.dart';
import 'package:eogretmen/views/splash_view.dart';
import 'package:eogretmen/views/login_view.dart';

class AppRouteGenerator {
  static const String APP_ROUTE_SPLASH = "/Splash";
  static const String APP_ROUTE_LOGIN = "/LogIn";
  static const String APP_ROUTE_HOME = "/Home";

  Route getAppRoutes(RouteSettings routeSettings) {
    print(routeSettings.name);
    switch (routeSettings.name) {
      case APP_ROUTE_SPLASH:
        return MaterialPageRoute<void>(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (BuildContext context) => Splash(),
        );

      case APP_ROUTE_LOGIN:
        return MaterialPageRoute<void>(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (BuildContext context) => LogIn(),
        );

      // case APP_ROUTE_HOME:
      //   return MaterialPageRoute<void>(
      //     settings: routeSettings,
      //     builder: (BuildContext context) => Home(),
      //   );

      default:
        return MaterialPageRoute<void>(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (BuildContext context) => Splash(),
        );
    }
  }
}
