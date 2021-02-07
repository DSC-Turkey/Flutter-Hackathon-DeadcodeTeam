import 'package:eogretmen/views/home/explorehorizontal_view.dart';
import 'package:flutter/material.dart';
import 'package:eogretmen/app/routes.dart';
import 'package:eogretmen/resource/themeStyles.dart';
import 'package:eogretmen/views/home/header_view.dart';

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
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        scrollDirection: Axis.vertical,
        child: SafeArea(
          top: true,
          left: true,
          right: true,
          child: Column(
            children: [
              HeaderView(userFirstName: "Oğuzhan"),
              ExploreHorizontalView(),
            ],
          ),
        ),
      ),
    );
  }
}
