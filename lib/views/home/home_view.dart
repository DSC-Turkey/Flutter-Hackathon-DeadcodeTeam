import 'package:flutter/material.dart';
import 'package:eogretmen/views/home/header_view.dart';
import 'package:eogretmen/views/home/explorehorizontal_view.dart';

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
