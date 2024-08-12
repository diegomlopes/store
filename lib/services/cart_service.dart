import '../models/cart_item.dart';
import '../models/product.dart';

class CartService {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Product product) {
    for (CartItem item in _cartItems) {
      if (item.product.id == product.id) {
        item.quantity++;
        return;
      }
    }
    _cartItems.add(CartItem(product: product));
  }

  void removeFromCart(Product product) {
    _cartItems.removeWhere((item) => item.product.id == product.id);
  }

  void clearCart() {
    _cartItems.clear();
  }

  double get totalPrice {
    return _cartItems.fold(
        0.0, (sum, item) => sum + item.product.price * item.quantity);
  }
}
