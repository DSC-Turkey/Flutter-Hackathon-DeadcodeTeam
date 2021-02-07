import 'package:deadcode_hackathon/views/profile.dart';
import 'package:flutter/material.dart';
//import './utilities/themeColors.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Helvetica',
      ),
      home: Profile(),
    );
  }
}
