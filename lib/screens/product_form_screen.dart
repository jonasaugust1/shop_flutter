import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({super.key});

  static const routeName = '/product-form';

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final imageUrlController = TextEditingController();
  final _imageUrlFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, dynamic>();

  @override
  void initState() {
    _imageUrlFocus.addListener(updateImage);
    super.initState();
  }

  @override
  void dispose() {
    imageUrlController.dispose();
    _imageUrlFocus.dispose();
    super.dispose();
  }

  void updateImage() {
    setState(() {
      
    });
  }

  void _submitForm() {
    _formKey.currentState?.save();

    final newProduct = Product(
      id: Random().nextDouble().toString(), 
      name: _formData['name'] as String, 
      description: _formData['description'] as String, 
      price: _formData['price'] as double, 
      imageUrl: _formData['imageUrl'] as String
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
        actions: [
          IconButton(
            onPressed: _submitForm, 
            icon: Icon(Icons.save)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome'
                ),
                textInputAction: TextInputAction.next,
                onSaved: (name) => _formData['name'] = name,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Preço'
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSaved: (price) => _formData['price'] = double.tryParse(price ?? ''),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Descrição'
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onSaved: (description) => _formData['description'] = description,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'URL da imagem'
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.url,
                      controller: imageUrlController,
                      focusNode: _imageUrlFocus,
                      onSaved: (imageUrl) => _formData['imageUrl'] = imageUrl,
                      onFieldSubmitted: (_) => _submitForm(),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 10, left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1
                      )
                    ),
                    alignment: Alignment.center,
                    child: imageUrlController.text.isEmpty 
                    ? 
                    Text('Informe a url') 
                    : 
                    FittedBox(
                      child: Image.network(
                        imageUrlController.text,
                        errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}