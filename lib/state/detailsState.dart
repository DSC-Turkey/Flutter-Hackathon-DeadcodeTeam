import 'package:eogretmen/state/loginState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailState extends GetxController {
  List data = [];
  detaildata() async {
    FirebaseAuth.instance.signInAnonymously();
    var databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.child("educations").once().then((DataSnapshot value) {
      if (value != null) {
        value.value.forEach((k, v) => {
              print(v.forEach((a, v) => v.value['name'])),
            });

        update();
      }
    });
  }
}
