import 'package:eogretmen/state/detailsState.dart';
import 'package:eogretmen/state/loginState.dart';
import 'package:flutter/material.dart';
import 'package:eogretmen/app/routes.dart';
import 'package:eogretmen/resource/themeColors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController txtfirstname = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  TextEditingController txtemail = new TextEditingController();
  TextEditingController txtlastname = new TextEditingController();
  String _gender, _birthdate, _edu;
  List<int> selectDate = [];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        physics: PageScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: signInWidget(context, size),
      ),
    );
  }

  Widget signInWidget(BuildContext context, Size size) {
    selectDate = birthdate();
    final LoginState c = Get.find();
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.15,
      ),
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Text(
            'KAYIT OL',
            style: GoogleFonts.montserrat(fontSize: 25),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          TextField(
            controller: txtfirstname,
            style: GoogleFonts.montserrat(fontSize: 14),
            decoration: InputDecoration(
              labelText: "İsim",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(50.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          TextField(
            controller: txtlastname,
            obscureText: true,
            style: GoogleFonts.montserrat(fontSize: 14),
            decoration: InputDecoration(
              labelText: "Soyisim",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(50.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<String>(
                value: _gender,
                hint: Text(
                  'Cinsiyet',
                  style: GoogleFonts.montserrat(fontSize: 14),
                ),
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    _gender = newValue;
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
              DropdownButton<String>(
                value: _birthdate,
                hint: Text(
                  'Doğum Yılı',
                  style: GoogleFonts.montserrat(fontSize: 14),
                ),
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    _birthdate = newValue;
                  });
                },
                items: selectDate.map<DropdownMenuItem<String>>((int value) {
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
            ],
          ),
          DropdownButton<String>(
            value: _edu,
            hint: Text(
              'Eğitim Düzeyiniz',
              style: GoogleFonts.montserrat(fontSize: 14),
            ),
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            onChanged: (String newValue) {
              setState(() {
                _edu = newValue;
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
          SizedBox(
            height: size.height * 0.025,
          ),
          TextField(
            controller: txtemail,
            obscureText: true,
            style: GoogleFonts.montserrat(fontSize: 14),
            decoration: InputDecoration(
              labelText: "Mail Adresi",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(50.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          TextField(
            controller: txtPassword,
            obscureText: true,
            style: GoogleFonts.montserrat(fontSize: 14),
            decoration: InputDecoration(
              labelText: "Şifre",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(50.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          TextField(
            controller: txtPassword,
            obscureText: true,
            style: GoogleFonts.montserrat(fontSize: 14),
            decoration: InputDecoration(
              labelText: "Şifre Tekrarı",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(50.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            onPressed: () => signInButton(),
            child: Text(
              'KAYIT OL',
              style: GoogleFonts.montserrat(fontSize: 14),
            ),
            textColor: ThemeColors.WHITE,
            color: ThemeColors.LIGHT_NAVY_BLUE,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          FlatButton(
            onPressed: () => Navigator.pushReplacementNamed(
                context, AppRouteGenerator.APP_ROUTE_LOGIN),
            child: Text(
              'Hesabın varsa giriş yapmak için tıkla',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: ThemeColors.GRAY,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  signInButton() {
    final DetailState c = Get.put(DetailState());

    Map<String, String> veriMapp = {
      "createdDate": DateTime.now().toString(),
      "email": txtemail.text,
      "password": txtPassword.text,
      "profileImage": "",
      "userAge": _birthdate,
      "userFirstName": txtfirstname.text,
      "UserLastName": txtlastname.text,
      "UserGender": _gender,
    };

    c.veriGetir("abc");
  }

  List<int> birthdate() {
    List<int> selectDate = [];
    for (int i = 1930; i < 2021; i++) {
      selectDate.add(i);
    }
    return selectDate;
  }
}
