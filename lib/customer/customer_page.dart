import 'package:flutter/material.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Muşteri Ana Sayfa'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Müşteri Ekle'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
