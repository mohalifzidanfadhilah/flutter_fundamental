import 'package:flutter/material.dart';
import 'package:proyek/module/menu/menu_page.dart';

class SplashScreenNotifier extends ChangeNotifier {
  final BuildContext context;

  SplashScreenNotifier(this.context){
    loading();
  }

  loading(){

    Future.delayed(const Duration(seconds: 2)).then((value){
      Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => const MenuPage()), (route) => false);
    }); 
  }
}