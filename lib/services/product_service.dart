import '../models/product.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(
      const Duration(seconds: 2),
    ); // Simulando uma chamada de rede
    return [
      Product(
          id: '1',
          name: 'Product 1',
          description: 'Description 1',
          price: 10.0),
      Product(
          id: '2',
          name: 'Product 2',
          description: 'Description 2',
          price: 20.0),
    ];
  }
}
