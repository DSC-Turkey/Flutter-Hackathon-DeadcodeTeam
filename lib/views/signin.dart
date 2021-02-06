import 'package:flutter/material.dart';
import '../utilities/themeColors.dart';

import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController txtUserName = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 200),
        child: signInWidget(),
      ),
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
    );
  }

  signInWidget() {
    return Column(
      children: [
        Image.asset(
          './lib/img/2.png',
          width: 150,
          height: 150,
        ),
        Text('E-Öğretmen',
            style: GoogleFonts.redressed(
                fontSize: 40, fontWeight: FontWeight.w600)),
        SizedBox(
          height: 50,
        ),
        TextField(
          controller: txtUserName,
          style: GoogleFonts.montserrat(fontSize: 18),
          decoration: InputDecoration(
            labelText: "Kullanıcı Adı",
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
          height: 30,
        ),
        RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 160, vertical: 20),
          onPressed: () => signInButton(),
          child: Text('GİRİŞ', style: GoogleFonts.montserrat(fontSize: 23)),
          textColor: ThemeColors.white,
          color: Color.fromRGBO(34, 6, 95, 0.6),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        FlatButton(
          onPressed: () => signInButton(),
          child: Text('Şifremi unuttum.',
              style: GoogleFonts.montserrat(fontSize: 20)),
          hoverColor: Colors.white,
        ),
        FlatButton(
          onPressed: () => signInButton(),
          child: Text(
            'Henüz hesabınız yoksa yeni bir hesap açmak için tıklayınız.',
            style: GoogleFonts.montserrat(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          color: Colors.white12,
        ),
      ],
    );
  }

  signInButton() {
    return true;
  }
}
