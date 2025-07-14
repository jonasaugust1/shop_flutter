import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((product) => product.isFavorite).toList();
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void saveProduct(Map<String, dynamic> data) {
    bool hasId = data['id'] != null;

    final newProduct = Product(
      id: hasId ? data['id'] : Random().nextDouble().toString(), 
      name: data['name'] as String, 
      description: data['description'] as String, 
      price: data['price'] as double, 
      imageUrl: data['imageUrl'] as String
    );

    if(hasId) {
      updateProduct(newProduct);
    } else {
      addProduct(newProduct);
    }
  }

  void updateProduct(Product product) {
    int index = _items.indexWhere((p) => p.id == product.id);

    if(index == -1) {
      return;
    }

    _items[index] = product;

    notifyListeners();
  }

  void deleteProduct(Product product) {
    final index = _items.indexWhere((p) => p.id == product.id);

    if(index == -1) {
      return;
    }
    
    _items.removeAt(index);
    notifyListeners();
  }
}

// GLOBAL STATE MANAGEMENT EXAMPLE
//  bool _showFavoritesOnly = false;

//   List<Product> get items {
//     if (_showFavoritesOnly) {
//       return _items.where((product) => product.isFavorite).toList();
//     }
    
//     return [..._items];
//   }

//   void showFavoritesOnly() {
//     _showFavoritesOnly = true;
//     notifyListeners();
//   }

//   void showAll() {
//     _showFavoritesOnly = false;
//     notifyListeners();
//   }