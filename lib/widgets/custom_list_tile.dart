import 'package:eksado_main/themes/light_theme.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final Function()? onTap;

  const CustomListTile({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: LightTheme.defaultTextTheme.bodyLarge!
                .copyWith(color: LightTheme.tertiaryColor),
          ),
          trailing:
              const Icon(Icons.arrow_right, color: LightTheme.secondaryColor),
        ),
      ),
    );
  }
}
