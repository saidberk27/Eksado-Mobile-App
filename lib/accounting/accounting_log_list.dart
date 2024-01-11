import 'package:eksado_main/themes/light_theme.dart';
import 'package:flutter/material.dart';

import 'account_log_model.dart';
import 'account_viewmodel.dart';

class AccountLogList extends StatefulWidget {
  const AccountLogList({super.key});

  @override
  State<AccountLogList> createState() => _AccountLogListState();
}

class _AccountLogListState extends State<AccountLogList> {
  AccountLogVM vm = AccountLogVM();
  Future<List<AccountLog>> _getAccountLogs() {
    return vm.getAccountLogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 140.0,
          title: Image.asset(
            "assets/images/logoM.png",
            fit: BoxFit.contain,
            height: 120,
          )),
      body: FutureBuilder(
        future: _getAccountLogs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        "${snapshot.data![index].accountType}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: LightTheme.secondaryColor,
                        ),
                      ),
                      subtitle: Text(
                        snapshot.data![index].amount.toString(),
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: LightTheme.tertiaryColor,
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Table(
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children: [
                                  _buildTableRow("Kayıt Tipi:",
                                      snapshot.data![index].accountType),
                                  _buildTableRow("Miktar",
                                      snapshot.data![index].amount.toString()),
                                  _buildTableRow("Açıklama:",
                                      snapshot.data![index].description),
                                ],
                              ),
                              ElevatedButton(
                                  // Delete customer button
                                  onPressed: () {
                                    vm.deleteAccountLog(snapshot.data![index]);
                                    Navigator.of(context).pop();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            LightTheme.warningColor),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                  ),
                                  child: const Text("Kaydı Sil"))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

TableRow _buildTableRow(String label, String value) {
  return TableRow(
    children: [
      TableCell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: LightTheme.defaultTextTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(value),
        ),
      ),
    ],
  );
}
