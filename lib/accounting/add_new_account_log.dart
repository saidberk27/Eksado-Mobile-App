import 'package:eksado_main/accounting/account_viewmodel.dart';
import 'package:eksado_main/accounting/accounting_log_list.dart';
import 'package:eksado_main/accounting/demo_data_creator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/custom_page_route.dart';
import '../widgets/custom_form.dart';
import 'account_log_model.dart';

class AddNewAccountLog extends StatelessWidget {
  const AddNewAccountLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140.0,
        title: Image.asset(
          "assets/images/logoM.png",
          fit: BoxFit.contain,
          height: 120,
        ),
      ),
      body: const Center(
        child: AddNewproductForm(),
      ),
    );
  }
}

class AddNewproductForm extends StatefulWidget {
  const AddNewproductForm({Key? key}) : super(key: key);

  @override
  _AddNewproductFormState createState() => _AddNewproductFormState();
}

class _AddNewproductFormState extends State<AddNewproductForm> {
  final _formKey = GlobalKey<FormState>();
  final AccountLogVM vm = AccountLogVM();

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String _accountType = "Gelir";
  final List<String> _accountTypeOptions = ["Gelir", "Gider", "Borç", "Alacak"];

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProductClassDropdown(
                title: "Muhasebe Kaydı Tipi",
                selectedOption: _accountType,
                options: _accountTypeOptions,
                onChanged: (String? newValue) {
                  setState(() {
                    _accountType = newValue!;
                  });
                },
              ),
              CustomTextFormField(
                labelText: "Miktar",
                validatorText: "Lütfen miktar giriniz",
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller:
                    _amountController, // Assign the controller to the form field
              ),
              const SizedBox(height: 10.0),
              CustomTextFormField(
                labelText: "Açıklama (İsteğe Bağlı)",
                validatorText: "Açıklama Girin( İsteğe Bağlı)",
                isRequired: false,
                controller:
                    _descriptionController, // Assign the controller to the form field
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    vm.addAccountLog(AccountLog(
                        accountType: _accountType,
                        amount: int.parse(_amountController.text),
                        date: DateTime.now().toString(),
                        description:
                            _descriptionController.text ?? "Açıklama yok"));
                    Navigator.pop(context);
                    Navigator.push(
                        context, customPageRoute(page: const AccountLogList()));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Kayıt başarıyla eklendi'),
                    ));
                  }
                },
                child: const Text('Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductClassDropdown extends StatelessWidget {
  final String title;
  final String selectedOption;
  final List<String> options;
  final ValueChanged<String?> onChanged;

  const ProductClassDropdown({
    super.key,
    required this.title,
    required this.selectedOption,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        const SizedBox(width: 50.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedOption,
              onChanged: onChanged,
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        )
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AddNewAccountLog(),
  ));
}
