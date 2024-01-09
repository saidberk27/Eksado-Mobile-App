import 'package:eksado_main/home/home_page.dart';
import 'package:eksado_main/product/product_viewmodel.dart';
import 'package:flutter/material.dart';

import '../utils/custom_page_route.dart';
import 'product_model.dart';

class AddNewProductPage extends StatelessWidget {
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
  final ProductVM vm = ProductVM();

  final TextEditingController _productNameController = TextEditingController();

  String _productClass = "O1 Tipi";
  List<String> _productClassOptions = [
    "O1 Tipi",
    "O2 Tipi",
    "O3 Tipi",
    "O4 Tipi"
  ];

  String _roofCovering = "0.5 mm Kenet Metal";
  List<String> _roofCoveringOptions = [
    "0.5 mm Kenet Metal",
    "1.0 mm Kenet Metal",
    "2.0 mm Kenet Metal",
    "3.0 mm Kenet Metal"
  ];

  String _glassOption = "6 mm Temperli Cam";
  List<String> _glassOptionOptions = [
    "6 mm Temperli Cam",
    "8 mm Temperli Cam",
    "10 mm Temperli Cam",
    "12 mm Temperli Cam"
  ];

  String _smartHomeOption = "Mevcut";
  List<String> _smartHomeOptionOptions = [
    "Mevcut",
    "Mevcut Değil",
  ];

  @override
  void dispose() {
    _productNameController.dispose();
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
              TextFormField(
                controller: _productNameController,
                decoration: InputDecoration(
                  labelText: "Ürün Adı",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen ürün adını girin';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              ProductClassDropdown(
                title: "Ürün Sınıfı",
                selectedOption: _productClass,
                options: _productClassOptions,
                onChanged: (String? newValue) {
                  setState(() {
                    _productClass = newValue!;
                  });
                },
              ),
              const SizedBox(height: 10.0),
              ProductClassDropdown(
                title: "Ürün Sınıfı",
                selectedOption: _roofCovering,
                options: _roofCoveringOptions,
                onChanged: (String? newValue) {
                  setState(() {
                    _roofCovering = newValue!;
                  });
                },
              ),
              const SizedBox(height: 10.0),
              ProductClassDropdown(
                title: "Cam Seçeneği",
                selectedOption: _glassOption,
                options: _glassOptionOptions,
                onChanged: (String? newValue) {
                  setState(() {
                    _glassOption = newValue!;
                  });
                },
              ),
              const SizedBox(height: 10.0),
              ProductClassDropdown(
                title: "Çatı Kaplaması",
                selectedOption: _roofCovering,
                options: _roofCoveringOptions,
                onChanged: (String? newValue) {
                  setState(() {
                    _roofCovering = newValue!;
                  });
                },
              ),
              const SizedBox(height: 10.0),
              ProductClassDropdown(
                title: "Akıllı Ev Seçeneği",
                selectedOption: _smartHomeOption,
                options: _smartHomeOptionOptions,
                onChanged: (String? newValue) {
                  setState(() {
                    _smartHomeOption = newValue!;
                  });
                },
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String productName = _productNameController.text;
                    String _productClassModel = _productClass;
                    String _roofCoveringModel = _roofCovering;
                    String _glassOptionModel = _glassOption;
                    String _smartHomeOptionModel = _smartHomeOption;
                    vm.addProduct(Product(
                        productName: productName,
                        productClass: _productClassModel,
                        roofCovering: _roofCoveringModel,
                        glassOption: _glassOptionModel,
                        smartHomeOption: _smartHomeOptionModel));
                    Navigator.pop(context);
                    Navigator.push(
                        context, customPageRoute(page: const HomePage()));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Ürün başarıyla eklendi')));
                  }
                },
                child: Text('Kaydet'),
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

  ProductClassDropdown({
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
        SizedBox(width: 50.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
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
  runApp(MaterialApp(
    home: AddNewProductPage(),
  ));
}
