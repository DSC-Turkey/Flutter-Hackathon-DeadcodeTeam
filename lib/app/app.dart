import 'package:flutter/material.dart';
import 'package:eogretmen/app/routes.dart';
import 'package:eogretmen/resource/appPreferences.dart';

class App extends StatelessWidget {
  // Singleton Pattern Instance
  static final App _instance = new App._internal();

  // App Private Constructor
  App._internal();
  factory App() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routeGenerator().getAppRoutes,
    );
  }

  // App Routes
  AppRouteGenerator routeGenerator() {
    return AppRouteGenerator();
  }

  // App Preferences
  AppPreferences getAppPreferences() {
    return AppPreferences();
  }
}
