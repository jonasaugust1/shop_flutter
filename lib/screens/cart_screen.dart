import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: cart.itemCount == 0
          ? Center(
              child: Text(
                'Carrinho vazio',
                style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.primary),
              ),
            )
          : Column(
            children: [
              Card(
                margin: const EdgeInsets.all(25),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total'),
                      const SizedBox(width: 10),
                      Chip(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: Text(
                          'R\$ ${cart.totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          // Implement checkout functionality here
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                        child: const Text('Finalizar Compra'),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cart.itemCount,
                  itemBuilder: (ctx, i) => CartItemWidget(cartItem: items[i]),
                ),
              )
            ],
          ),
    );
  }
}