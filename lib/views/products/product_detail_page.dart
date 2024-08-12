import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/cart_viewmodel.dart';
import '../../models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image.network(product
            //     .imageUrl), // Assumindo que o produto tenha uma URL de imagem
            SizedBox(height: 16),
            Text(
              product.name,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text('\$${product.price}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text(product.description),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Provider.of<CartViewModel>(context, listen: false)
                    .addToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} added to cart')),
                );
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
