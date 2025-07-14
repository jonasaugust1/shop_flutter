import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key,});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductList>(context);
    final items = products.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: items[i],
        child: ProductItem(),
      ),
      itemCount: items.length,
    );
  }
}