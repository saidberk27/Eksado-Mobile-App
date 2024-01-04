import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_fab.dart';
import '../widgets/custom_list_tile.dart';

class AccountingPage extends StatelessWidget {
  const AccountingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomListTile(
              title: "Hammadde Alımı",
              onTap: () {
                if (kDebugMode) {
                  print("Hammadde Alımı Butonuna Basıldı");
                }
              }),
          CustomListTile(
              title: "Ürün Satışı",
              onTap: () {
                if (kDebugMode) {
                  print("Ürün Satışı Butonuna Basıldı");
                }
              }),
          CustomListTile(
              title: "Gelir",
              onTap: () {
                if (kDebugMode) {
                  print("Gelir Butonuna Basıldı");
                }
              }),
          CustomListTile(
              title: "Gider",
              onTap: () {
                if (kDebugMode) {
                  print("Gider Butonuna Basıldı");
                }
              }),
          CustomListTile(
              title: "Borç",
              onTap: () {
                if (kDebugMode) {
                  print("Borç Butonuna Basıldı");
                }
              }),
        ],
      ),
      floatingActionButton: CustomFAB(
        label: "Muhasebe Ekle",
        onPressed: () {
          if (kDebugMode) {
            print("Müşteri Ekleme Butonuna Basıldı");
          }
        },
      ),
    );
  }
}
