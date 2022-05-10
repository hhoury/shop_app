import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/screens/auth_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import './screens/orders_screen.dart';
import './providers/orders.dart';
import './screens/cart_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/cart.dart';
import './providers/products.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Products>(
            create: (_) => Products('', '', []),
            update: (ctx, auth, previousProducts) => Products(
                auth.token,
                auth.userId,
                previousProducts == null ? [] : previousProducts.items),
          ),
          ChangeNotifierProvider(
            create: (context) => Cart(),
            // update: (ctx, auth, previousCart) => Cart(
            //     auth.token, previousCart == null ? [] : previousCart.items),
          ),
          ChangeNotifierProxyProvider<Auth, Orders>(
            create: (context) => Orders('', []),
            update: (ctx, auth, previousOrders) => Orders(auth.token,
                previousOrders == null ? [] : previousOrders.orders),
          ),
        ],
        child: Consumer<Auth>(
            builder: (ctx, auth, _) => MaterialApp(
                  title: 'MyShop',
                  theme: ThemeData(
                    primaryColor: Colors.purple,
                    colorScheme:
                        ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                            .copyWith(secondary: Colors.deepOrange),
                    fontFamily: 'Lato',
                  ),
                  home: auth.isAuth ? ProductsOverviewScreen() : AuthScreen(),
                  routes: {
                    ProductDetailScreen.routeName: (context) =>
                        ProductDetailScreen(),
                    CartScreen.routeName: (context) => CartScreen(),
                    OrdersScreen.routeName: (context) => OrdersScreen(),
                    UserProductsScreen.routeName: (context) =>
                        const UserProductsScreen(),
                    EditProductScreen.routeName: (context) =>
                        EditProductScreen(),
                    // AuthScreen.routeName: (context) => AuthScreen()
                  },
                )));
  }
}
