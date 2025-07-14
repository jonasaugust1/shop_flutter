import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/screens/product_form_screen.dart';
import 'package:shop/widgets/app_drawer_widget.dart';
import 'package:shop/widgets/product_item_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});
  static const routeName = '/products';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar produtos'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(
              ProductFormScreen.routeName
            ), 
            icon: Icon(Icons.add)
          )
        ],
      ),
      drawer: AppDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: products.items.length,
          itemBuilder: (ctx, i) => Column(
            children: [
              ProductItemWidget(product: products.items[i]),
              const Divider()
            ],
          )
        ),
      ),
    );
  }
}