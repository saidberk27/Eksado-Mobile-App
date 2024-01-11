import 'package:eksado_main/themes/light_theme.dart';
import 'package:flutter/material.dart';

import 'customer_model.dart';
import 'customer_viewmodel.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({super.key});

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  CustomerVM vm = CustomerVM();
  Future<List<Customer>> _getCustomers() {
    return vm.getCustomers();
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
        future: _getCustomers(),
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
                        "${snapshot.data![index].name} ${snapshot.data![index].surname}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: LightTheme.secondaryColor,
                        ),
                      ),
                      subtitle: Text(
                        snapshot.data![index].company,
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
                                  _buildTableRow(
                                      "Şirket:", snapshot.data![index].company),
                                  _buildTableRow(
                                      "E-Posta:", snapshot.data![index].email),
                                  _buildTableRow("Telefon:",
                                      snapshot.data![index].phoneNumber),
                                  _buildTableRow(
                                    "Cinsiyet:",
                                    snapshot.data![index].isMale
                                        ? "Erkek"
                                        : "Kadın",
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                  // Delete customer button
                                  onPressed: () {
                                    vm.deleteCustomer(snapshot.data![index]);
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
                                  child: const Text("Müşteriyi Sil"))
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
