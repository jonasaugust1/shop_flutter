import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  static const routeName = '/products-overview';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final products = provider.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Overview'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => ProductItem(product: products[i]),
        itemCount: products.length,
      ),
    );
  }
}