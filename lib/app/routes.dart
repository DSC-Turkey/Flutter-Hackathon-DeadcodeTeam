import 'package:eogretmen/views/detail.dart';
import 'package:eogretmen/views/signin.dart';
import 'package:eogretmen/views/signup.dart';
import 'package:eogretmen/views/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouteGenerator {
  static const String APP_ROUTE_SPLASH = "/Splash";
  static const String APP_ROUTE_REGISTER = "/Sign";
  static const String APP_ROUTE_SEARCH = "/Search";
  static const String APP_ROUTE_HOME = "/Home";
  static const String APP_ROUTE_DETAIL = "/Detail";

  Route getAppRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case APP_ROUTE_SPLASH:
        return MaterialPageRoute<void>(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (BuildContext context) => Splash(),
        );

      case APP_ROUTE_REGISTER:
        return MaterialPageRoute<void>(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (BuildContext context) => Sign(),
        );

      case APP_ROUTE_DETAIL:
        return MaterialPageRoute<void>(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (BuildContext context) => Details(),
        );

      default:
        return MaterialPageRoute<void>(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (BuildContext context) => Splash(),
        );
    }
  }
}
