import 'package:flutter/material.dart';
import 'package:shop/widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  static const routeName = '/products-overview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Overview'),
      ),
      body: const ProductGrid(),
    );
  }
}

