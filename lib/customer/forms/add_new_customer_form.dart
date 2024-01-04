import 'package:eksado_main/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNewCustomerForm extends StatefulWidget {
  const AddNewCustomerForm({super.key});

  @override
  _AddNewCustomerFormState createState() => _AddNewCustomerFormState();
}

class _AddNewCustomerFormState extends State<AddNewCustomerForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Müşteri Adı',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen müşteri adını girin';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Müşteri Soyadı',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen müşteri soyadını girin';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Müşteri Firması',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen müşteri firmasını girin';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Müşteri Maili',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen müşteri mailini girin';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                keyboardType:
                    TextInputType.number, // Set keyboard type to numeric
                inputFormatters: [
                  FilteringTextInputFormatter
                      .digitsOnly, // Allow only numeric input
                ],
                decoration: InputDecoration(
                  labelText: 'Müşteri Telefonu',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen müşteri telefonunu girin';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                height: 75,
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, perform desired action
                    }
                  },
                  child: Text(
                    'Kaydet',
                    style: LightTheme.defaultTextTheme.displaySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
