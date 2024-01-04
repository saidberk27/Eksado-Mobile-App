import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Ürün Ana Sayfa'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Ürün Ekle'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
