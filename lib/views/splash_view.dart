import 'package:eogretmen/app/routes.dart';
import 'package:eogretmen/resource/themeStyles.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeStyles.lightTheme(),
      home: SplashView(),
      onGenerateRoute: AppRouteGenerator().getAppRoutes,
    );
  }
}

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Text('E-öğretmen uygulamasına hoşgeldiniz.'),
      ),
    );
  }
}
