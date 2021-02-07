import 'package:eogretmen/views/home/detail.dart';
import 'package:flutter/material.dart';
import 'package:eogretmen/widgets/main_app_widget.dart';
import 'package:eogretmen/views/search/search_view.dart';
import 'package:eogretmen/views/splash/splash_view.dart';
import 'package:eogretmen/views/auth/login_view.dart';
import 'package:eogretmen/views/auth/register_view.dart';

class AppRouteGenerator {
  static const String APP_ROUTE_SPLASH = "/Splash";
  static const String APP_ROUTE_LOGIN = "/LogIn";
  static const String APP_ROUTE_REGISTER = "/Register";
  static const String APP_ROUTE_SEARCH = "/Search";
  static const String APP_ROUTE_HOME = "/Home";
  static const String APP_ROUTE_DETAIL = "/Details";

  Route getAppRoutes(RouteSettings routeSettings) {
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

      case APP_ROUTE_DETAIL:
        return MaterialPageRoute<void>(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (BuildContext context) => Details(),
        );

      case APP_ROUTE_REGISTER:
        return MaterialPageRoute<void>(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (BuildContext context) => Register(),
        );

      case APP_ROUTE_HOME:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => MainApp(),
        );

      case APP_ROUTE_SEARCH:
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) => Search(),
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
