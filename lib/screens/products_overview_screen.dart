import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/widgets/product_grid.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  static const routeName = '/products-overview';

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showFavoritesOnly = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Overview'),
        actions: [
          Consumer<Cart>(
            builder: (ctx, cart, child) => Badge(
              alignment: Alignment.centerRight,
              label: Text(cart.itemCount.toString()),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: child,
            ),
            child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () => Navigator.of(context).pushNamed('/cart'),
              ),
          ),
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
            setState(() {
              _showFavoritesOnly = value == FilterOptions.favorites ? true : false;
            });
          },
          )
        ],
      ),
      body: ProductGrid(showFavoritesOnly: _showFavoritesOnly,),
    );
  }
}

