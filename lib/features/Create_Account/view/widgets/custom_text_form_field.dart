import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;

  const CustomTextFormField({
    required this.controller,
    required this.label,
    required this.icon,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: Icon(icon),
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      ),
      readOnly: readOnly,
      onTap: onTap,
      maxLines: maxLines,
      style: const TextStyle(fontSize: 16, height: 1.5),
    );
  }
}
