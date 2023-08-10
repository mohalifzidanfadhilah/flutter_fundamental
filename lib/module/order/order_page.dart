import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek/module/order/order_notifier.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OrderNotifier(context), 
      child: Consumer<OrderNotifier>(
        builder: (context, value, child) => const Scaffold(
          body: Center(
            child: Text("Order Page"),
          ),
        ),
      ),
    );
  }
}