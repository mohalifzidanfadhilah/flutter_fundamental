import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek/module/shop/shop_notifier.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ShopNotifier(context),
      child: Consumer<ShopNotifier>(
        builder: (context, value, child) => const Scaffold(
          body: Center(
            child: Text("Shop page"),
            ),
        ),
      ),
    );
  }
}