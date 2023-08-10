import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek/module/auth/login_notifier.dart';
import 'package:proyek/module/auth/login_widget.dart';
import 'package:proyek/utils/image_path.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>LoginNotifier(context), 
      child: Consumer<LoginNotifier>(
        builder: (context, value, child) => 
        Scaffold(
          backgroundColor: Colors.grey[300],
          body: Stack(
            children: [
              Center(
                child: Container(
                  color: Colors.blue,
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width > 600 
                      ? 400 
                      : double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        top: 0,
                        child: CustomPaint(
                          painter: BackgrounLoginShape(),
                      )),
                      Positioned(
                        top: 160,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 160,
                              width: 160,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(2, 2),
                                    color: Colors.grey,
                                    blurRadius: 10,
                                  )
                                ]
                              ),
                            child: Image.asset(
                              ImageAssets.logo,
                              height: 120,),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const Text("Cari marketplace \nterpercaya disini",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text("Silahkan Daftar Atau Masuk menggunakan akun dibawah",
                      style: TextStyle(
                        fontWeight: FontWeight.w400
                      ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: value.email,
                                    decoration: const InputDecoration(
                                      labelText: "Email",
                                    ),
                                    validator: (e) {
                                      if (e!.isEmpty) {
                                        return "wajib Diisi";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                          const SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: (){
                              value.cek();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                 ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                          ],
                        )),
                        Positioned(
                          top: 32,
                          left: 16,
                          child: IconButton(
                            onPressed: ()=>Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white,
                            ),))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}