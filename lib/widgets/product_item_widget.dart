import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/screens/product_form_screen.dart';

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
              onPressed: () =>
                Navigator
                .of(context)
                .pushNamed(
                  ProductFormScreen.routeName,
                  arguments: product
                ), 
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.primary,
              )
            ),
            IconButton(
              onPressed: () {
                showAdaptiveDialog(
                  context: context, 
                  builder: (ctx) => AlertDialog(
                    title: Text('Tem certeza?'),
                    content: Text('Tem certeza que deseja excluir esse produto?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(), 
                        child: Text('Não')
                      ),
                      TextButton(
                        onPressed: () {
                          Provider.of<ProductList>(context, listen: false).deleteProduct(product);
                          Navigator.of(context).pop();
                        }, 
                        child: Text('Sim')
                      )
                    ],
                  )
                );
              }, 
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.error
              ),
            )
          ],
        ),
      ),
    );
  }
}