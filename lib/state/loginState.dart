import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eogretmen/api/network/endpoints.dart';
import 'package:eogretmen/app/routes.dart';
import 'package:eogretmen/resource/sharedprefs.dart';
import 'package:eogretmen/state/detailsState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginState extends GetxController {
  bool userLogin = false;
  bool basildimi = false;
  String girisisim, giriseposta, girisresim, girisId, girisloginId;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  girisYap(email, sifre, context) async {
    var databaseReference = FirebaseDatabase.instance.reference();
    databaseReference
        .child("users")
        .orderByChild("email")
        .equalTo("deneme")
        .limitToFirst(1)
        .once()
        .then((value) {
      if (value != null) {
        var password;
        value.value.forEach((k, v) => {password = v['password']});
        if (password == sifre.text) {
          Navigator.pushReplacementNamed(
              context, AppRouteGenerator.APP_ROUTE_HOME);
        } else {
          Get.snackbar("hata", "hata");
        }
      }
    });
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
    final response =
        await http.post(APIEndpoints.USERS_API, body: json.encode(map));

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
