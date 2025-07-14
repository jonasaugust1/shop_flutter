import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/widgets/product_grid.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  static const routeName = '/products-overview';

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Overview'),
        actions: [
          PopupMenuButton(
            itemBuilder: (ctx) {
            return [
              const PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text('Filtrar por Favoritos'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Todos'),
              ),
            ];
          },
          onSelected: (value) {
            if (value == FilterOptions.favorites) {
              productList.showFavoritesOnly();
            } else {
              productList.showAll();
            }
          },
          )
        ],
      ),
      body: const ProductGrid(),
    );
  }
}

