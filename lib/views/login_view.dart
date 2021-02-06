import 'package:flutter/material.dart';
import 'package:eogretmen/app/routes.dart';
import 'package:eogretmen/resource/themeColors.dart';
import 'package:google_fonts/google_fonts.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController txtUserName = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();

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
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.15,
      ),
      height: size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
            ),
            Text(
              'E-Öğretmen',
              style: GoogleFonts.kaushanScript(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                color: ThemeColors.BLACK,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            TextField(
              controller: txtUserName,
              style: GoogleFonts.montserrat(fontSize: 14),
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
            RaisedButton(
              padding: EdgeInsets.all(0),
              onPressed: () => {},
              child: Container(
                width: size.width,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [ThemeColors.LIGHT_PURPLE, ThemeColors.DARK_PURPLE],
                  ),
                ),
                child: Text(
                  'GİRİŞ',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: ThemeColors.WHITE,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            FlatButton(
              onPressed: () => Navigator.pushReplacementNamed(
                  context, AppRouteGenerator.APP_ROUTE_REGISTER),
              child: Text(
                'Henüz hesabınız yoksa yeni bir hesap açmak için tıklayınız.',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
