// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Chip(
                      label: Text('\$${cart.totalAmount}',
                          style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .titleMedium
                                ?.color,
                          )),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(),
                          cart.totalAmount,
                        );
                        cart.clear();
                      },
                      child: Text('Order Now'),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (ctx, i) {
                    return CartItem(
                        id: cart.items.values.toList()[i].id,
                        productId: cart.items.keys.toList()[i],
                        title: cart.items.values.toList()[i].title,
                        quantity: cart.items.values.toList()[i].quantity,
                        price: cart.items.values.toList()[i].price);
                  }))
        ],
      ),
    );
  }
}
