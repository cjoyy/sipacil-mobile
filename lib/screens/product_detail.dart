import 'package:flutter/material.dart';
import 'package:sipacil/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.fields.product)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.product,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text("Price: Rp${product.fields.price}"),
            const SizedBox(height: 8),
            Text("Description: ${product.fields.description}"),
            const SizedBox(height: 8),
            Text("Rating: ${product.fields.rating}"),
            const SizedBox(height: 8),
            Text("Available: ${product.fields.available ? 'Yes' : 'No'}"),
          ],
        ),
      ),
    );
  }
}
