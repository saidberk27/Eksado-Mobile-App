import 'package:eksado_main/accounting/account_defaults_model.dart';
import 'package:eksado_main/accounting/account_viewmodel.dart';
import 'package:eksado_main/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/custom_form.dart';

class DefaultAccountValuesPage extends StatelessWidget {
  DefaultAccountValuesPage({super.key});
  final AccountLogVM vm = AccountLogVM();
  final TextEditingController _taxRateController = TextEditingController();
  final TextEditingController _incomeBudgetController = TextEditingController();

  final TextEditingController _outComeBudgetController =
      TextEditingController();

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
        future: vm.getAccountDefaults(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  dataTable(snapshot),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextFormField(
                    labelText: "Vergi Oranı",
                    validatorText: "Lütfen vergi oranı giriniz",
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller:
                        _taxRateController, // Assign the controller to the form field
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextFormField(
                    labelText: "Gelir Bütçesi",
                    validatorText: "Lütfen gelir bütçesini giriniz",
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller:
                        _incomeBudgetController, // Assign the controller to the form field
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextFormField(
                    labelText: "Gider Bütçesi",
                    validatorText: "Lütfen gider bütçesini giriniz",
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller:
                        _outComeBudgetController, // Assign the controller to the form field
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        vm.updateAccountDefault(AccountDefaultsModel(
                            taxRate: _taxRateController.text,
                            incomeBudget: _incomeBudgetController.text,
                            outcomeBudget: _outComeBudgetController.text));
                        Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Muhasebe Varsayılanları Başarıyla GÜncellendi')));
                      },
                      child: const SizedBox(
                          height: 50,
                          child: Center(
                              child: Text("Varsayılan Değerleri Güncelle"))))
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Table dataTable(AsyncSnapshot<AccountDefaultsModel> snapshot) {
    return Table(
      children: [
        TableRow(children: [
          Text(
            "Vergi Oranı: ",
            style: LightTheme.defaultTextTheme.displayMedium,
          ),
          Text(
            "%${snapshot.data!.taxRate.toString()}",
            style: LightTheme.defaultTextTheme.displayMedium,
          )
        ]),
        TableRow(children: [
          Text(
            "Gelir Bütçesi: ",
            style: LightTheme.defaultTextTheme.displayMedium,
          ),
          Text(
            "${snapshot.data!.incomeBudget.toString()}₺",
            style: LightTheme.defaultTextTheme.displayMedium,
          )
        ]),
        TableRow(children: [
          Text(
            "Gider Bütçesi: ",
            style: LightTheme.defaultTextTheme.displayMedium,
          ),
          Text(
            "${snapshot.data!.outcomeBudget.toString()}₺",
            style: LightTheme.defaultTextTheme.displayMedium,
          )
        ])
      ],
    );
  }
}
