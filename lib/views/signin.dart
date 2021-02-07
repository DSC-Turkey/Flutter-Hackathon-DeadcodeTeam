import 'package:eogretmen/app/routes.dart';
import 'package:eogretmen/resource/themeColors.dart';
import 'package:eogretmen/state/detailsState.dart';
import 'package:eogretmen/state/loginState.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class Sign extends StatelessWidget {
  TextEditingController txtUserName = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final LoginState c = Get.put(LoginState());
    return Scaffold(
      backgroundColor: ThemeColors.WHITE,
      body: GetBuilder<LoginState>(
        builder: (_) => SingleChildScrollView(
          child: SingleChildScrollView(
            physics: PageScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: signInWidget(context, size),
          ),
        ),
      ),
    );
  }

  signInWidget(BuildContext context, Size size) {
    final LoginState c = Get.find();
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
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.2, vertical: Get.height * 0.02),
              onPressed: () =>
                  signInButton(txtUserName.text, txtPassword.text, context),
              child: c.basildimi == false
                  ? Text('GİRİŞ', style: GoogleFonts.montserrat(fontSize: 23))
                  : CircularProgressIndicator(),
              textColor: ThemeColors.WHITE,
              color: Color.fromRGBO(34, 6, 95, 0.6),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              onPressed: () => null,
              child: Text('Şifremi unuttum.',
                  style: GoogleFonts.montserrat(fontSize: 15)),
              hoverColor: Colors.white,
            ),
            FlatButton(
              onPressed: () => {
                Navigator.pushNamed(context, AppRouteGenerator.APP_ROUTE_SIGNUP)
              },
              child: Text(
                'Henüz hesabınız yoksa yeni bir hesap açmak için tıklayınız.',
                style: GoogleFonts.montserrat(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              color: Colors.white12,
            ),
          ],
        )));
  }

  signInButton(email, passwordd, context) {
    final DetailState c = Get.put(DetailState());

    c.veriGetir("abc");
    Navigator.pushReplacementNamed(context, AppRouteGenerator.APP_ROUTE_DETAIL);
  }
}
