import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';
import 'package:shop/screens/product_datail_screen.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context, 
      listen: false
    );

    final cart = Provider.of<Cart>(
      context, 
      listen: false
    );
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () => product.toggleFavoriteStatus(),
            ),
          ),
          title: Text(
            product.name,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              cart.addItem(product);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Produto adicionado com sucesso'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'Desfazer', 
                    onPressed: () => cart.removeSingleItem(product.id)
                  ),
                )
              );
            },
          ),
        ),
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.error,
              size: 50,
              color: Colors.red,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDatailScreen.routeName,
              arguments: product,
            );
          },
        ),
      ),
    );
  }
}