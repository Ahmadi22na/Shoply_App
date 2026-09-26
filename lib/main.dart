import 'package:flutter/material.dart';
import 'data/dummy_products.dart';

void main() {
  runApp(const ShopApp());
}

/// Sprint 1 only proves the Model + local data compile and load correctly.
/// The real screens (Login, Products, etc.) get built in the next sprints.
class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('Sprint 1 Check')),
        body: Center(
          child: Text(
            'Loaded ${dummyProducts.length} products locally ✅',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
