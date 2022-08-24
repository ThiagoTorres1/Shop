import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';

class CartList with ChangeNotifier {
  Map<String, Cart> _items = {};

  Map<String, Cart> get items => {..._items};

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cart) {
      total += cart.price * cart.quantity;
    });
    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existingItem) => Cart(
          id: existingItem.id,
          productId: existingItem.productId,
          name: existingItem.name,
          quantity: existingItem.quantity + 1,
          price: existingItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id,
        () => Cart(
          id: Random().nextDouble().toString(),
          productId: product.id,
          name: product.name,
          quantity: 1,
          price: product.price,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
