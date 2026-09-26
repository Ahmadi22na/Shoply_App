import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Image.asset(
                      product.imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                product.name,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                '\$${product.price.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                product.description,
                style: const TextStyle(
                    fontSize: 15, height: 1.4, color: Colors.black87),
              ),
              const SizedBox(height: 20),
              _DetailRow(label: 'Brand', value: product.brand),
              const Divider(),
              _DetailRow(label: 'Category', value: product.category),
              const Divider(),
              _DetailRow(
                label: 'In Stock',
                value: product.inStock ? 'Yes' : 'No',
                valueColor:
                    product.inStock ? Colors.green.shade700 : Colors.red.shade700,
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: product.inStock
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('${product.name} added to cart')),
                          );
                        }
                      : null,
                  icon: const Icon(Icons.shopping_cart),
                  label: Text(product.inStock ? 'Add to Cart' : 'Out of Stock'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Small helper row used for Brand / Category / In Stock — kept private
/// to this file since nothing else needs it.
class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _DetailRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w600, color: valueColor),
          ),
        ],
      ),
    );
  }
}
