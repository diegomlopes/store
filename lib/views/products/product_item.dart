import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'product_detail_page.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailPage(product: product)),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image.network(product
            //     .imageUrl), // Assumindo que o produto tenha uma URL de imagem
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('\$${product.price}', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
