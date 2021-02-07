import 'package:eogretmen/app/routes.dart';
import 'package:eogretmen/resource/themeColors.dart';
import 'package:eogretmen/resource/themeStyles.dart';
import 'package:flutter/material.dart';
import 'package:eogretmen/views/home/home_view.dart';
import 'package:eogretmen/views/profile/profile_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget renderScreens(BuildContext context) {
    switch (currentIndex) {
      case 0:
        return HomeView();
      case 1:
        return ProfileView();
      default:
        return HomeView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeStyles.lightTheme(),
      onGenerateRoute: AppRouteGenerator().getAppRoutes,
      home: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: renderScreens(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, AppRouteGenerator.APP_ROUTE_SEARCH);
          },
          child: Icon(Icons.search),
          backgroundColor: ThemeColors.DARK_PURPLE,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ]),
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: GNav(
                gap: 8,
                activeColor: ThemeColors.BLACK,
                iconSize: 26,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 500),
                tabs: [
                  GButton(
                    icon: Icons.home,
                    backgroundColor: ThemeColors.YELLOW.withOpacity(0.5),
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.person,
                    backgroundColor: ThemeColors.GRAY.withOpacity(0.5),
                    text: 'Profile',
                  ),
                ],
                selectedIndex: currentIndex,
                onTabChange: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
