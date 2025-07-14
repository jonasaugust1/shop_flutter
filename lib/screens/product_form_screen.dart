import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

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
  final _formData = <String, dynamic>{};

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

  @override
  void didChangeDependencies() {
    if(_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;

      if(arg != null) {
        final product = arg as Product;
        _formData['id'] = product.id;
        _formData['name'] = product.name;
        _formData['price'] = product.price;
        _formData['description'] = product.description;
        _formData['imageUrl'] = product.imageUrl;

        imageUrlController.text = product.imageUrl;
      }
    }
    super.didChangeDependencies();
  }

  void updateImage() {
    setState(() {
      
    });
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if(!isValid) {
      return;
    }

    _formKey.currentState?.save();

    Provider.of<ProductList>(context, listen: false).saveProduct(_formData);
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
                initialValue: _formData['name'],
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
                textInputAction: TextInputAction.next,
                onSaved: (name) => _formData['name'] = name,
                validator: (name) {
                  if(name == null || name.trim().isEmpty) {
                    return 'Nome é obrigatório';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['price'].toString(),
                decoration: InputDecoration(
                  labelText: 'Preço'
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSaved: (price) => _formData['price'] = double.tryParse(price ?? ''),
                validator: (price) {
                  if(price == null || price.trim().isEmpty) {
                    return 'Preço é obrigatório';
                  }

                  final priceParsed = double.tryParse(price.replaceFirst(',', '.'));

                  if(priceParsed == null) {
                    return 'Preço deve conter apenas números';
                  }

                  if(priceParsed <= 0) {
                    return 'Proço deve ser maior que zero';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['description'],
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