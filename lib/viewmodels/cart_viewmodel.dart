import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/product.dart';
import '../services/cart_service.dart';

class CartViewModel with ChangeNotifier {
  final CartService _cartService = CartService();

  List<CartItem> get cartItems => _cartService.cartItems;

  void addToCart(Product product) {
    _cartService.addToCart(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartService.removeFromCart(product);
    notifyListeners();
  }

  void clearCart() {
    _cartService.clearCart();
    notifyListeners();
  }

  double get totalPrice => _cartService.totalPrice;
}
