import "package:flutter/material.dart";
import 'package:proyek/models/produk_model.dart';
import 'package:proyek/network/network.dart';
import 'package:proyek/repository/produk_repository.dart';

class HomeNotifier extends ChangeNotifier {
  final BuildContext context;

  HomeNotifier(this.context) {
    getProduk();
  }
  var isLoding = true;
  int offset = 0;
  int limit = 15;
  List<ProdukModel> list = [];
  getProduk() async {
    list.clear();
    isLoding = true;
    notifyListeners();
    ProdukRepository.getProduk(NetworkURL.getProduk(), offset, limit)
        .then((value) {
      if (value['status_code'] == 200) {
        for (Map<String, dynamic> i in value['produk']) {
          list.add(ProdukModel.fromJson(i));
        }
        isLoding = false;
        notifyListeners();
      } else {
        isLoding = false;
        notifyListeners();
      }
    });
  }
  int menu = 0;
  gantiMenu(int b) {
    menu = b;
    notifyListeners();
  }
}
