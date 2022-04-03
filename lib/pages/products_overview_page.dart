import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

// ignore: use_key_in_widget_constructors
class ProductsOverviewPage extends StatelessWidget {
  // const String routeName = '/products-overview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
      ),
      body: ProductsGrid(),
    );
  }
}
