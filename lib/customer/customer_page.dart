import 'package:eksado_main/customer/add_new_customer_page.dart';
import 'package:eksado_main/widgets/custom_list_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/custom_page_route.dart';
import '../widgets/custom_fab.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomListTile(
              title: "Müşterileri Görüntüle",
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
        label: "Müşteri Ekle",
        onPressed: () {
          Navigator.push(context, customPageRoute(page: AddNewCustomerPage()));
        },
      ),
    );
  }
}
