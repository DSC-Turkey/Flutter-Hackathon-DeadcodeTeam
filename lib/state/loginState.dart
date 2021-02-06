import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class LoginState extends GetxController {
  bool userLogin = false;
  bool basildimi = false;
  login(email, passwordd) {
    setBasildimi(true);
    var databaseReference = FirebaseDatabase.instance.reference();
    databaseReference
        .child("users")
        .orderByChild("email")
        .equalTo(email)
        .once()
        .then((value) {
      if (value != null) {
        print(value.value[1]['password']);
        if (value.value[1]['password'] == passwordd) {
          setBasildimi(false);
          userLogin = true;
          update();
        } else {
          setBasildimi(false);
          Get.snackbar("Hata", "Şifreniz yanlış");
        }
      }
    });
  }

  setBasildimi(bool deger) {
    basildimi = deger;
    update();
  }
}
