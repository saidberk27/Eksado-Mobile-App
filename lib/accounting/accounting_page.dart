import 'package:eksado_main/accounting/accounting_log_list.dart';
import 'package:eksado_main/accounting/add_new_account_log.dart';
import 'package:eksado_main/accounting/default_account_values.dart';
import 'package:eksado_main/utils/custom_page_route.dart';
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
              title: "Muhasebe Grafikleri",
              onTap: () {
                if (kDebugMode) {
                  print("Muhasebe Grafikleri Butonuna Basıldı");
                }
              }),
          CustomListTile(
              title: "Muhasebe Kayıtları",
              onTap: () {
                if (kDebugMode) {
                  print("Muhsabe Kayıtları Butonuna Basıldı");
                }
                Navigator.push(
                    context, customPageRoute(page: const AccountLogList()));
              }),
          CustomListTile(
              title: "Varsayılan Muhasebe Değerleri",
              onTap: () {
                if (kDebugMode) {
                  print("Muhsabe Kayıtları Butonuna Basıldı");
                }
                Navigator.push(
                    context, customPageRoute(page: DefaultAccountValuesPage()));
              }),
        ],
      ),
      floatingActionButton: CustomFAB(
        label: "Muhasebe Kaydı Ekle",
        onPressed: () {
          if (kDebugMode) {
            print("Muhasebe Ekleme Butonuna Basıldı");
          }
          Navigator.push(
              context, customPageRoute(page: const AddNewAccountLog()));
        },
      ),
    );
  }
}
