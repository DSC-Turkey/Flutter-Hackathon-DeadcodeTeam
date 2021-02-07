import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eogretmen/state/loginState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailState extends GetxController {
  List data = [];
  List data2 = [];
  veriGetir(kategori) async {
    List<dynamic> list = List<dynamic>();

    var val = await FirebaseFirestore.instance
        .collection('education')
        .doc('H9y6EneZQjTZmBNReAAv')
        .get();

    data = val[kategori];
    update();
  }
}
