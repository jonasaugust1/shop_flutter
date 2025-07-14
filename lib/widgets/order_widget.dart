import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/models/order.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key, required this.order});

  final Order order;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text('R\$ ${order.amount.toStringAsFixed(2)}'),
        subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(order.createdAt)),
        trailing: IconButton(
          icon: const Icon(Icons.expand_more),
          onPressed: () {
            // Handle more options
          },
        ),
      ),
    );
  }
}