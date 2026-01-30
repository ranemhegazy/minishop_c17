import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  int get cartCount => _cartItems.length;

  double get totalPrice {
    double total = 0;
    for (var item in _cartItems) {
      total += item.price;
    }
    return total;
  }

  void addProduct(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}
