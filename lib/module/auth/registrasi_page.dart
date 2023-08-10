import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek/module/auth/registrasi_notifier.dart';
import 'package:proyek/utils/image_path.dart';

class RegistrasiPage extends StatelessWidget {
  const RegistrasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegistrasiNotifier(context),
      child: Consumer<RegistrasiNotifier>(
        builder: (context, value, child) => SafeArea(
            child: Scaffold(
          body: Center(
            child: Container(
              color: Colors.white,
              height: double.infinity,
              width: MediaQuery.of(context).size.width > 600
              ? 400
              : double.infinity,
              child: 
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Form(
                        key: value.keyForm,
                        child: ListView(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: value.nama,
                              decoration: const InputDecoration(
                                labelText: "Nama Lengkap",
                              ),
                              validator: (e) {
                                if (e!.isEmpty) {
                                  return "wajib Diisi";
                                } else {
                                  return null;
                                }
                              },
                            ),
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
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: value.phone,
                              decoration: const InputDecoration(
                                labelText: "Phone",
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
                              onTap: () => value.cek(),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.greenAccent,
                                ),
                                child: const Text(
                                  "Simpan",
                                  textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white
                                  ),),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
            ),
          ),
        )),
      ),
    );
  }
}
