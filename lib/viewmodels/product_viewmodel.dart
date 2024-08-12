import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class ProductViewModel with ChangeNotifier {
  List<Product> _products = [];
  final ProductService _productService = ProductService();

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    _products = await _productService.fetchProducts();
    notifyListeners();
  }
}
