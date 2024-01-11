import 'package:eksado_main/product/product_model.dart';
import 'package:eksado_main/themes/light_theme.dart';
import 'package:flutter/material.dart';

import 'product_viewmodel.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ProductVM vm = ProductVM();
  Future<List<Product>> _getProducts() {
    return vm.getProducts();
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
        future: _getProducts(),
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
                        snapshot.data![index].productName,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: LightTheme.secondaryColor,
                        ),
                      ),
                      subtitle: Text(
                        snapshot.data![index].productClass,
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
                                  _buildTableRow("Ürün Sınıfı",
                                      snapshot.data![index].productClass),
                                  _buildTableRow("Cam Seçeneği:",
                                      snapshot.data![index].glassOption),
                                  _buildTableRow("Çatı Kaplaması:",
                                      snapshot.data![index].roofCovering),
                                  _buildTableRow("Akıllı Ev Seçeneği:",
                                      snapshot.data![index].smartHomeOption),
                                ],
                              ),
                              ElevatedButton(
                                  // Delete Product button
                                  onPressed: () {
                                    vm.deleteProduct(snapshot.data![index]);
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
                                  child: const Text("Ürünü Sil"))
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
