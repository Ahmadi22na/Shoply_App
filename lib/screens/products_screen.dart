import 'package:flutter/material.dart';
import '../data/dummy_products.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'product_details_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool _isGridView = true;
  bool _isSearching = false;
  String _query = '';

  List<Product> get _filteredProducts => dummyProducts
      .where((p) => p.name.toLowerCase().contains(_query.toLowerCase()))
      .toList();

  void _openDetails(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductDetailsScreen(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final products = _filteredProducts;

    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search products...',
                  border: InputBorder.none,
                ),
                onChanged: (value) => setState(() => _query = value),
              )
            : const Text('Products'),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) _query = '';
              });
            },
          ),
          IconButton(
            icon: Icon(_isGridView ? Icons.view_list : Icons.grid_view),
            onPressed: () => setState(() => _isGridView = !_isGridView),
          ),
        ],
      ),
      body: products.isEmpty
          ? const Center(child: Text('No products found'))
          : Padding(
              padding: const EdgeInsets.all(12),
              child: _isGridView
                  ? GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.78,
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductCard(
                          product: product,
                          isGridView: true,
                          onTap: () => _openDetails(product),
                        );
                      },
                    )
                  : ListView.separated(
                      itemCount: products.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductCard(
                          product: product,
                          isGridView: false,
                          onTap: () => _openDetails(product),
                        );
                      },
                    ),
            ),
    );
  }
}
