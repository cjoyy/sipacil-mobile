import 'package:flutter/material.dart';
import 'package:sipacil/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry item;

  const ProductDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product: ${item.fields.product}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Description: ${item.fields.description}"),
            const SizedBox(height: 8),
            Text("Price: ${item.fields.price}"),
            const SizedBox(height: 8),
            Text("Rating: ${item.fields.rating}"),
            const SizedBox(height: 8),
            Text("Date: ${item.fields.date}"),
            const SizedBox(height: 8),
            Text("Available: ${item.fields.available}"),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Back to Product List"),
            ),
          ],
        ),
      ),
    );
  }
}
