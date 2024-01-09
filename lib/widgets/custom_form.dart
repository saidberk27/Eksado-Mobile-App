import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String validatorText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller; // Added controller argument
  final bool isRequired;
  CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.validatorText,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const <TextInputFormatter>[],
    this.isRequired = true,
    required this.controller, // Added controller argument
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Passed controller to TextFormField
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(),
        ),
      ),
      validator: (value) {
        if (!isRequired) {
          return null;
        }
        if (value!.isEmpty) {
          return validatorText;
        }
        return null;
      },
    );
  }
}
