import 'package:flutter/material.dart';
import 'package:shop/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
      child: ListTile(
        leading: CircleAvatar(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FittedBox(
              child: Text('R\$ ${cartItem.price.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(cartItem.name),
        subtitle: Text('Total: R\$ ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}'),
        trailing: Text('${cartItem.quantity}x'),
      ),
    );
  }
}