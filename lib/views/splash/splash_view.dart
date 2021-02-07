import 'dart:async';
import 'package:flutter/material.dart';

import 'package:eogretmen/app/app.dart';
import 'package:eogretmen/app/routes.dart';
import 'package:eogretmen/resource/themeColors.dart';
import 'package:eogretmen/resource/themeStyles.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  var _logoAnimationController, _logoAnimation;

  @override
  void initState() {
    super.initState();

    _logoAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _logoAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _logoAnimationController,
    );

    _logoAnimation.addListener(() => this.setState(() {}));
    _logoAnimationController.forward();
    startAnimationTimeout();
  }

  startAnimationTimeout() async {
    return Timer(const Duration(seconds: 1), handleAnimationTimeout);
  }

  void handleAnimationTimeout() async {
    // Waiting app preferences to be ready.
    await App().getAppPreferences().isPreferencesReady;
    // Navigate next screen
    App().getAppPreferences().getIsLogin().then((isLogin) => {
          if (isLogin == true)
            {
              Navigator.pushReplacementNamed(
                  context, AppRouteGenerator.APP_ROUTE_HOME)
            }
          else
            {
              Navigator.pushReplacementNamed(
                  context, AppRouteGenerator.APP_ROUTE_LOGIN)
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: _logoAnimation.value * 200,
                height: _logoAnimation.value * 225,
                child: Image.asset("assets/images/logo.png"),
              ),
              Text(
                "E-Öğretmen",
                style: GoogleFonts.kaushanScript(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: ThemeColors.BLACK,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
