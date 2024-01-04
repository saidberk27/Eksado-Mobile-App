import 'package:flutter/material.dart';

class AccountingPage extends StatelessWidget {
  const AccountingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Muhasebe Ana Sayfa'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Muhasebe Kaydı Ekle'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
