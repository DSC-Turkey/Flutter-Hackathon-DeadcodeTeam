import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eogretmen/resource/sharedprefs.dart';
import 'package:eogretmen/state/detailsState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginState extends GetxController {
  bool userLogin = false;
  bool basildimi = false;
  String girisisim, giriseposta, girisresim, girisId, girisloginId;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  girisYap(email, sifre) async {
    UserCredential _user =
        await _auth.signInWithEmailAndPassword(email: email, password: sifre);
    SharedPrefs.saveMail(email);
    SharedPrefs.saveloginId(_user.user.uid);

    SharedPrefs.saveName(girisisim);
    SharedPrefs.saveId(_user.user.uid);

    SharedPrefs.login();
    profilresmiGetir(email);

    return true;
  }

  profilresmiGetir(email) async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .where("email", isEqualTo: email)
        .get();
    girisresim = result.docs[0]['profilResim'].toString();
    SharedPrefs.savePhoto(girisresim);
  }

  signUp(Map map) async {
    final response = await http.post(
        "https://deadcode-hackathon-default-rtdb.firebaseio.com/users/.json?auth=0JjzW52KHN3hJNYmFv3qNJ1zVFID8AEWS1ZiUfre",
        body: json.encode(map));

    switch (response.statusCode) {
      case HttpStatus.ok:
        print(response.body);
        return true;

      default:
        print("");
    }
  }

  setBasildimi(bool deger) {
    basildimi = deger;
    update();
  }
}
