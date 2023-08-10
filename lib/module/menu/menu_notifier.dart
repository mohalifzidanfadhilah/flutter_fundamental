import 'package:flutter/material.dart';
import 'package:proyek/cache/pref.dart';
import 'package:proyek/module/auth/login_page.dart';
import 'package:proyek/module/auth/registrasi_page.dart';

class MenuNotifier extends ChangeNotifier {
  final BuildContext context;

  MenuNotifier(this.context){
    Pref().getUsers().then((value) {
      value.id != "" ? login= true : login = false;
      notifyListeners();
    });
  }
  

  int page = 0;
  var login = false;
  gantiPage(int index) {
    if (index != 0) {
      if (login) {
        page = index;   
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    } else {
      page = index;
    }
    notifyListeners();
  }
}