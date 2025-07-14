import 'package:flutter/material.dart';
import 'package:shop/screens/product_datail_screen.dart';
import 'package:shop/screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          secondary: Colors.deepOrange
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          centerTitle: true
        ),
      ),
      home: ProductsOverviewScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
        ProductDatailScreen.routeName: (ctx) => ProductDatailScreen(),
      },
    );
  }
}