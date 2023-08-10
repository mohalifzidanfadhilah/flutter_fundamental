import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek/module/profile/profile_notifier.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileNotifier(context),
      child: Consumer<ProfileNotifier>(
        builder: (context, value, child) => const Scaffold(
          body: Center(
            child: Text("Profile Page"),
          ),
        ),
      ),
    );
  }
}