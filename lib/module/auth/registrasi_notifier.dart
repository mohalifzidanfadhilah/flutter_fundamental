import 'package:flutter/material.dart';
import 'package:proyek/cache/pref.dart';
import 'package:proyek/models/users_model.dart';
import 'package:proyek/module/menu/menu_page.dart';
import 'package:proyek/network/network.dart';
import 'package:proyek/repository/auth_repository.dart';

class RegistrasiNotifier extends ChangeNotifier {
  final BuildContext context;

  RegistrasiNotifier(this.context);

  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  final keyForm = GlobalKey<FormState>();

  cek() {
    if (keyForm.currentState!.validate()) {
      simpan();
    } else {}
  }

  simpan() async {
    AuthRepository.daftar(
            NetworkURL.registrasi(), email.text, nama.text, phone.text)
        .then((value) {
      if (value['status_code'] == 200) {
        UsersModel users = UsersModel.fromJson(value);
        Pref().setUsers(users);
        Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => MenuPage()),
          (route) => false);
        notifyListeners();
      } else {
        print(value['message']);
      }
    });
  }
}
