import 'package:flutter/material.dart';
//import 'package:grouped_buttons/grouped_buttons.dart';
import '../utilities/themeColors.dart';

import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController txtUserName = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  String _gender;
  String _birthdate;
  String _edu;
  List<int> selectDate = new List<int>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 220),
        child: signInWidget(),
      ),
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
    );
  }

  signInWidget() {
    selectDate = birthdate();
    return Column(
      children: [
        Text('KAYIT OL', style: GoogleFonts.montserrat(fontSize: 50)),
        SizedBox(
          height: 50,
        ),
        TextField(
          controller: txtUserName,
          style: GoogleFonts.montserrat(fontSize: 18),
          decoration: InputDecoration(
            labelText: "Ad",
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(50.0),
              borderSide: new BorderSide(),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: txtPassword,
          obscureText: true,
          style: GoogleFonts.montserrat(fontSize: 18),
          decoration: InputDecoration(
            labelText: "Soyad",
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(50.0),
              borderSide: new BorderSide(),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            DropdownButton<String>(
              value: _gender,
              hint: Text(
                'Cinsiyet',
                style: GoogleFonts.montserrat(fontSize: 22),
              ),
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black, fontSize: 22),
              onChanged: (String newValue) {
                setState(() {
                  _gender = newValue;
                  print(newValue);
                });
              },
              items: <String>['Kadın', 'Erkek']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              width: 10,
            ),
            DropdownButton<String>(
              value: _birthdate,
              hint: Text(
                'Doğum Yılı',
                style: GoogleFonts.montserrat(fontSize: 22),
              ),
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black, fontSize: 22),
              onChanged: (String newValue) {
                setState(() {
                  _birthdate = newValue;
                  print(newValue);
                });
              },
              items: selectDate.map<DropdownMenuItem<String>>((int value) {
                return DropdownMenuItem<String>(
                  value: value.toString(),
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            SizedBox(
              width: 10,
            ),
            DropdownButton<String>(
              value: _edu,
              hint: Text(
                'Eğitim Düzeyi',
                style: GoogleFonts.montserrat(fontSize: 22),
              ),
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black, fontSize: 25),
              onChanged: (String newValue) {
                setState(() {
                  _edu = newValue;
                  print(newValue);
                });
              },
              items: <String>['İlkokul', 'Ortaokul', 'Lise', 'Üniversite']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: txtPassword,
          obscureText: true,
          style: GoogleFonts.montserrat(fontSize: 18),
          decoration: InputDecoration(
            labelText: "Mail Adresi",
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(50.0),
              borderSide: new BorderSide(),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: txtPassword,
          obscureText: true,
          style: GoogleFonts.montserrat(fontSize: 18),
          decoration: InputDecoration(
            labelText: "Şifre",
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(50.0),
              borderSide: new BorderSide(),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: txtPassword,
          obscureText: true,
          style: GoogleFonts.montserrat(fontSize: 18),
          decoration: InputDecoration(
            labelText: "Şifre Tekrarı",
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(50.0),
              borderSide: new BorderSide(),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          onPressed: () => signInButton(),
          child: Text('KAYIT OL', style: GoogleFonts.montserrat(fontSize: 23)),
          textColor: ThemeColors.white,
          color: Color.fromRGBO(34, 6, 95, 0.6),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
      ],
    );
  }

  signInButton() {
    return true;
  }

  List<int> birthdate() {
    List<int> selectDate = new List<int>();
    for (int i = 1930; i < 2021; i++) {
      selectDate.add(i);
    }
    return selectDate;
  }
}
