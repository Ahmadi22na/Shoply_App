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

  /// Path to the local asset image, e.g. 'assets/images/nike_air_max.png'.
  /// Declared under pubspec.yaml -> flutter -> assets, so still fully local
  /// (no network, no JSON) — satisfies the "local dummy data only" rule.
  final String imagePath;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.brand,
    required this.category,
    required this.inStock,
    required this.description,
    required this.imagePath,
  });
}
