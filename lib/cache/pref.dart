import 'package:proyek/models/users_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pref{
  static String id ="id";
  static String email ="email";
  static String phone ="phone";
  static String namaLengkap ="nama_lengkap";
  static String photo ="photo";
  static String tglRegistrasi ="tgl_regstrasi";

  setUsers(UsersModel users)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(Pref.id, users.id);
    pref.setString(Pref.email, users.email);
    pref.setString(Pref.phone, users.phone);
    pref.setString(Pref.namaLengkap, users.namaLengkap);
    pref.setString(Pref.photo, users.photo);
    pref.setString(Pref.tglRegistrasi, users.tglRegistrasi);
  }
  Future<UsersModel>getUsers()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    UsersModel users = UsersModel(
      id: pref.getString(Pref.id) ?? "", 
      email: pref.getString(Pref.email) ?? "", 
      phone: pref.getString(Pref.phone) ?? "", 
      namaLengkap: pref.getString(Pref.namaLengkap) ?? "", 
      photo: pref.getString(Pref.photo) ?? "", 
      tglRegistrasi: pref.getString(Pref.tglRegistrasi) ?? "");
    return users;
  }
} 