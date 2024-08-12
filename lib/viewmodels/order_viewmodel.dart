import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/payment_method.dart';

class OrderViewModel with ChangeNotifier {
  Future<bool> processOrder(
      {required List<CartItem> cartItems,
      required PaymentMethod paymentMethod}) async {
    // Simulating the payment processing.
    await Future.delayed(Duration(seconds: 2));

    // Add the logical for processing de payment.
    return true;
  }
}
