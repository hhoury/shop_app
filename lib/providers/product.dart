import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
  void toggleFavoriteStatus() async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = Uri.parse(
        'https://shop-app-99d19-default-rtdb.firebaseio.com/products/$id.json');

    try {
      final res =
          await http.patch(url, body: json.encode({'isFavorite': isFavorite}));
      if (res.statusCode >= 400) {
        isFavorite = oldStatus;
        notifyListeners();
        throw HttpException('could not delete product');
      }
    } catch (error) {
      isFavorite = oldStatus;
      notifyListeners();
      throw HttpException('could not delete product');
    }
  }
}
