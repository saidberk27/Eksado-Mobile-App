import 'package:eksado_main/customer/customer_viewmodel.dart';
import 'package:eksado_main/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_form.dart';
import '../customer_model.dart';

class AddNewCustomerForm extends StatefulWidget {
  const AddNewCustomerForm({super.key});

  @override
  _AddNewCustomerFormState createState() => _AddNewCustomerFormState();
}

class _AddNewCustomerFormState extends State<AddNewCustomerForm> {
  final _formKey = GlobalKey<FormState>();
  final CustomerVM vm = CustomerVM();

  // Create TextEditingController instances for each form field
  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _customerSurnameController =
      TextEditingController();
  final TextEditingController _customerCompanyController =
      TextEditingController();
  final TextEditingController _customerEmailController =
      TextEditingController();
  final TextEditingController _customerPhoneController =
      TextEditingController();

  bool _isMale = true;
  @override
  void dispose() {
    // Dispose the TextEditingController instances to avoid memory leaks
    _customerNameController.dispose();
    _customerSurnameController.dispose();
    _customerCompanyController.dispose();
    _customerEmailController.dispose();
    _customerPhoneController.dispose();
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
              CustomTextFormField(
                labelText: "Müşteri Adı",
                validatorText: "Lütfen müşteri adını girin",
                controller:
                    _customerNameController, // Assign the controller to the form field
              ),
              const SizedBox(height: 10.0),
              CustomTextFormField(
                labelText: "Müşteri Soyadı",
                validatorText: "Lütfen müşteri Soyadını girin",
                controller:
                    _customerSurnameController, // Assign the controller to the form field
              ),
              const SizedBox(height: 10.0),
              CustomTextFormField(
                labelText: "Müşteri Firması",
                validatorText: "Lütfen müşteri firmasını girin",
                controller:
                    _customerCompanyController, // Assign the controller to the form field
              ),
              const SizedBox(height: 10.0),
              CustomTextFormField(
                labelText: "Müşteri Maili",
                validatorText: "Lütfen müşteri mailini girin",
                controller:
                    _customerEmailController, // Assign the controller to the form field
              ),
              const SizedBox(height: 10.0),
              CustomTextFormField(
                labelText: "Müşteri Telefonu",
                validatorText: "Lütfen müşteri telefonunu girin",
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller:
                    _customerPhoneController, // Assign the controller to the form field
              ),
              const SizedBox(height: 10.0),
              genderBox(),
              const SizedBox(height: 10.0),
              SizedBox(
                height: 75,
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String customerName = _customerNameController.text;
                      String customerSurname = _customerSurnameController.text;
                      String customerCompany = _customerCompanyController.text;
                      String customerEmail = _customerEmailController.text;
                      String customerPhone = _customerPhoneController.text;

                      Customer customer = Customer(
                          name: customerName,
                          surname: customerSurname,
                          company: customerCompany,
                          email: customerEmail,
                          phoneNumber: customerPhone,
                          isMale: _isMale);

                      vm.addCustomer(customer);
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

  Row genderBox() {
    return Row(
      children: [
        Checkbox(
          value: _isMale,
          onChanged: (value) {
            setState(() {
              _isMale = value!;
            });
          },
        ),
        Text('Erkek'),
        Checkbox(
          value: !_isMale,
          onChanged: (value) {
            setState(() {
              _isMale = !value!;
            });
          },
        ),
        Text('Kadın'),
      ],
    );
  }
}
