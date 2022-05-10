// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/providers/cart.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // const ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: Consumer<Product>(
            builder: (BuildContext context, product, Widget? child) {
          // child never changes, doesn't depend on data
          return GridTileBar(
            leading: IconButton(
              onPressed: () {
                product.toggleFavoriteStatus(authData.token);
              },
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              onPressed: () {
                cart.addItem(product.id, product.title, product.price);
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: content))
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                // Scaffold.of(context).hideCurrentSnackBar();
                // Scaffold.of(context).showSnackBar(
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Added item to cart'),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        cart.removeSingleItem(product.id);
                      }),
                ));
              },
              icon: const Icon(
                Icons.shopping_cart,
              ),
              color: Theme.of(context).colorScheme.secondary,
            ),
            backgroundColor: Colors.black87,
          );
        }),
      ),
    );
  }
}
