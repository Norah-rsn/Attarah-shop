import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["فلفل أسود", "80.0", "images/blackPaper.png"],
    ["حلبه", "60.0", "images/fenugreek.png"],
    ["كاري", "35.0", "images/curry.png"],
    ["ثوم", "30.0", "images/garlic.png"],
    ["بابريكا", "25.50", "images/paprika.png"],
    ["ملح", "5.80", "images/salt.png"],
    ["حبة سوداء", "85.30", "images/sesameSeeds.png"],
    ["كركم", "20.0", "images/turmeric.png"],
  ];

  final List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  void addItemsToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemsFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
