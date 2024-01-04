import 'package:eksado_main/customer/forms/add_new_customer_form.dart';
import 'package:flutter/material.dart';

class AddNewCustomerPage extends StatelessWidget {
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
        body: const Center(
          child: AddNewCustomerForm(),
        ));
  }
}
