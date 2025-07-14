import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/widgets/app_drawer_widget.dart';
import 'package:shop/widgets/order_widget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  static const routeName = '/order';

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderList>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
      ),
      body: ListView.builder(
        itemCount: orders.items.length,
        itemBuilder: (ctx, i) => OrderWidget(order: orders.items[i]),
      ),
      drawer: const AppDrawerWidget(),
    );
  }
}