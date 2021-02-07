import 'dart:convert';
import 'dart:io';

import 'package:eogretmen/state/detailsState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginState extends GetxController {
  bool userLogin = false;
  bool basildimi = false;
  login(email, passwordd) async {
    final DetailState c = Get.put(DetailState());
    setBasildimi(true);
    var databaseReference = FirebaseDatabase.instance.reference();
    databaseReference
        .child("users")
        .orderByChild("email")
        .equalTo(email)
        .once()
        .then((value) async {
      if (value != null) {
        setBasildimi(false);
        var password;

        value.value.forEach((k, v) => {password = v['password']});

        if (password == passwordd) {
          setBasildimi(false);

          await c.detaildata();

          userLogin = true;
        } else {
          setBasildimi(false);
          Get.snackbar("Hata", "Şifreniz yanlış");
        }
      }
    });
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
