import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {}, 
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.primary,
              )
            ),
            IconButton(
              onPressed: () {}, 
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.error
              )
            )
          ],
        ),
      ),
    );
  }
}