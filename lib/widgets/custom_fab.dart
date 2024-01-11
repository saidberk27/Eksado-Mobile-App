import 'package:eksado_main/themes/light_theme.dart';
import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final String label;
  final Function()? onPressed;

  const CustomFAB({
    super.key,
    required String this.label,
    required Function() this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: Text(label),
      icon: const Icon(Icons.add),
      backgroundColor: LightTheme.secondaryColor,
      foregroundColor: Colors.white,
    );
  }
}
