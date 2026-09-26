import 'package:flutter/material.dart';
import '../models/product_model.dart';

/// One reusable card used by BOTH the grid layout and the list layout.
/// [isGridView] controls whether it lays out vertically (grid tile)
/// or horizontally (list tile) — same data, same tap behavior.
class ProductCard extends StatelessWidget {
  final Product product;
  final bool isGridView;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.isGridView,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final imageBox = Container(
      width: isGridView ? double.infinity : 64,
      height: isGridView ? 100 : 64,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          product.imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );

    final nameAndPrice = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          product.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(
          '\$${product.price.toStringAsFixed(0)}',
          style: TextStyle(
              color: Colors.blue.shade700, fontWeight: FontWeight.bold),
        ),
      ],
    );

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: isGridView
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    imageBox,
                    const SizedBox(height: 8),
                    nameAndPrice,
                  ],
                )
              : Row(
                  children: [
                    imageBox,
                    const SizedBox(width: 12),
                    Expanded(child: nameAndPrice),
                    const Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
        ),
      ),
    );
  }
}
