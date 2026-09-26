import 'package:flutter/material.dart';
import '../models/product_model.dart';

/// Local, hard-coded product data — no JSON, no API.
/// Every screen that needs products reads from this single list.
final List<Product> dummyProducts = [
  const Product(
    id: 'p1',
    name: 'Nike Air Max',
    price: 120,
    brand: 'Nike',
    category: 'Shoes',
    inStock: true,
    description:
        'All day comfort with a modern design. Suitable for everyday wear.',
    icon: Icons.directions_run,
  ),
  const Product(
    id: 'p2',
    name: 'Travel Backpack',
    price: 60,
    brand: 'Urban Gear',
    category: 'Bags',
    inStock: true,
    description:
        'A practical backpack with multiple compartments for daily travel.',
    icon: Icons.backpack,
  ),
  const Product(
    id: 'p3',
    name: 'Wireless Headphones',
    price: 199,
    brand: 'SoundMax',
    category: 'Electronics',
    inStock: true,
    description:
        'Comfortable wireless headphones with clear sound and long battery life.',
    icon: Icons.headphones,
  ),
  const Product(
    id: 'p4',
    name: 'Smart Watch',
    price: 299,
    brand: 'TechTime',
    category: 'Wearables',
    inStock: true,
    description:
        'A modern smart watch for notifications, activity tracking, and daily use.',
    icon: Icons.watch,
  ),
  const Product(
    id: 'p5',
    name: 'Sunglasses',
    price: 90,
    brand: 'Vision',
    category: 'Accessories',
    inStock: true,
    description:
        'Lightweight sunglasses with a simple design for sunny days.',
    icon: Icons.wb_sunny_outlined,
  ),
  const Product(
    id: 'p6',
    name: 'Casual Shoes',
    price: 85,
    brand: 'StreetStep',
    category: 'Shoes',
    inStock: false,
    description:
        'Comfortable casual shoes designed for daily walking and relaxed outfits.',
    icon: Icons.hiking,
  ),
];
