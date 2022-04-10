import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/orders_page.dart';
import './providers/orders.dart';
import './pages/cart_page.dart';
import './pages/product_detail_page.dart';
import './providers/cart.dart';
import './pages/products_overview_page.dart';
import './providers/products.dart';
import './pages/user_products_page.dart';
import './pages/edit_product_page.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primaryColor: Colors.purple,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.deepOrange),
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewPage(),
        routes: {
          ProductDetailPage.routeName: (context) => ProductDetailPage(),
          CartPage.routeName: (context) => CartPage(),
          OrdersPage.routeName: (context) => OrdersPage(),
          UserProductsPage.routeName: (context) => const UserProductsPage(),
          EditProductPage.routeName: (context) => EditProductPage(),
        },
      ),
    );
  }
}
