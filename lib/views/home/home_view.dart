import 'package:eogretmen/resource/themeColors.dart';
import 'package:eogretmen/views/home/explorehorizontal_view.dart';
import 'package:flutter/material.dart';
import 'package:eogretmen/app/routes.dart';
import 'package:eogretmen/resource/themeStyles.dart';
import 'package:eogretmen/views/home/header_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeStyles.lightTheme(),
      home: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: renderScreens(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Search screen navigate
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
      onGenerateRoute: AppRouteGenerator().getAppRoutes,
    );
  }

  Widget renderScreens(BuildContext context) {
    switch (currentIndex) {
      case 0:
        return HomeView();
      case 1:
        return Text("Profil");
      default:
        return HomeView();
    }
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
