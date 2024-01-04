import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_fab.dart';
import '../widgets/custom_list_tile.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomListTile(
              title: "Ürünleri Görüntüle",
              onTap: () {
                if (kDebugMode) {
                  print("Müşteri Ekleme Butonuna Basıldı");
                }
              }),
          CustomListTile(
              title: "Aktif Siparişler",
              onTap: () {
                if (kDebugMode) {
                  print("Aktif Siparişler Butonuna Basıldı");
                }
              }),
        ],
      ),
      floatingActionButton: CustomFAB(
        label: "Ürün Ekle",
        onPressed: () {
          if (kDebugMode) {
            print("Müşteri Ekleme Butonuna Basıldı");
          }
        },
      ),
    );
  }
}
