import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek/module/splash_screen/splash_screen_notifier.dart';
import 'package:proyek/utils/colors_utils.dart';
import 'package:proyek/utils/image_path.dart';


class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>SplashScreenNotifier(context), 
      child: Consumer<SplashScreenNotifier>(
        builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        body: Stack(
          children: [
            Center(
              child: Container(
                color: Colors.white,
                  width: MediaQuery.of(context).size.width > 600
                  ? 400
                  :double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageAssets.logo,
                        height: 120,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const CircularProgressIndicator(
                        color: Colors.blue,
                      ),
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