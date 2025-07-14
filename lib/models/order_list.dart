import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order.dart';

class OrderList with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  int get orderCount {
    return _orders.length;
  }

  void addOrder(Cart cart) {
    _orders.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        amount: cart.totalAmount,
        products: cart.items.values.toList(),
        createdAt: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void removeOrder(String orderId) {
    _orders.removeWhere((order) => order.id == orderId);
    notifyListeners();
  }

  Order? findById(String id) {
    return _orders.firstWhere((order) => order.id == id);
  }
}