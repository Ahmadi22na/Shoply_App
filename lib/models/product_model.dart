import 'package:flutter/material.dart';

/// Represents a single product in the shop.
/// This class only describes the SHAPE of the data — no UI logic here.
class Product {
  final String id;
  final String name;
  final double price;
  final String brand;
  final String category;
  final bool inStock;
  final String description;

  /// No product photos were provided in the exam assets, so we use a
  /// built-in Material icon as a stand-in image. This still satisfies
  /// "local dummy data only" since nothing is loaded from disk/network.
  final IconData icon;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.brand,
    required this.category,
    required this.inStock,
    required this.description,
    required this.icon,
  });
}
