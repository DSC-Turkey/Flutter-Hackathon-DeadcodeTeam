import 'package:eogretmen/app/routes.dart';
import 'package:eogretmen/resource/themeStyles.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeStyles.lightTheme(),
      home: HomeView(),
      onGenerateRoute: AppRouteGenerator().getAppRoutes,
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        physics: PageScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
