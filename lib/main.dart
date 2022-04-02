import 'package:flutter/material.dart';
import 'package:shop_app/pages/product_detail_page.dart';
import './pages/products_overview_page.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
        primaryColor: Colors.purple,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(secondary: Colors.deepOrange),
        fontFamily: 'Lato',
      ),
      home: ProductsOverviewPage(),
      routes: {ProductDetailPage.routeName: (context) => ProductDetailPage()},
    );
  }
}
