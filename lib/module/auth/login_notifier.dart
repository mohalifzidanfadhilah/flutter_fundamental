import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:proyek/cache/pref.dart';
import 'package:proyek/models/users_model.dart';
import 'package:proyek/module/auth/registrasi_page.dart';
import 'package:proyek/module/menu/menu_page.dart';
import 'package:proyek/network/network.dart';
import 'package:proyek/repository/auth_repository.dart';

// final FirebaseAuth auth = FirebaseAuth.instance;

// class LoginNotifier extends ChangeNotifier {
//   final BuildContext context;

//   LoginNotifier(this.context);

//   TextEditingController email = TextEditingController();
//   final KeyForm = GlobalKey<FormState>();

//   GoogleSignIn googleSignIn = GoogleSignIn(scopes: <String>[
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ]);

//   cek() {
//     if (KeyForm.currentState!.validate()) {
//       simpan();
//     }
//   }

//   UsersModel? users;
//   simpan() {
//     AuthRepository.login(NetworkURL.login(), email.text.trim()).then((value) {
//       if (value['status_code'] == 200) {
//         users = UsersModel.fromJson(value);
//         Pref().setUsers(users!);
//         notifyListeners();
//       } else {
//         print(value['message']);
//       }
//     });
//   }

//   LoginGoogle() async {
//     // CustomDialog.loading(context);
//     UserCredential userCredential;
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser!.authentication;
//     final GoogleAuthCredential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//     userCredential = await auth.signInWithCredential(GoogleAuthCredential);
//     if (kDebugMode) {
//       print(userCredential.user!.displayName);
//       print(userCredential.user!.photoURL);
//       print(userCredential.user!.providerData[0].email);
//     }
//     AuthRepository.login(
//             NetworkURL.login(), userCredential.user!.providerData[0].email!)
//         .then((value) {
//       if (value['status_code'] == 200) {
//         users = UsersModel.fromJson(value);
//         Pref().setUsers(users!);
//         Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(builder: (context) => const MenuPage()),
//             (route) => false);
//       } else {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => const RegistrasiPage()));
//       }
//     });
//   }
// }

class LoginNotifier extends ChangeNotifier {
  final BuildContext context;

  LoginNotifier(this.context);

  TextEditingController email = TextEditingController();
  final keyForm = GlobalKey<FormState>();

  cek(){
    if  (keyForm.currentState!.validate()){
      simpan();
    }
  }

  UsersModel? users;
  simpan(){
    AuthRepository.login(NetworkURL.login(),email.text.trim()).then((value) {
      if (value['status_code'] == 200) {
        users = UsersModel.fromJson(value);
        Pref().setUsers(users!);
        notifyListeners();
      } else {
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => const RegistrasiPage()));
      }
    });
  }
}