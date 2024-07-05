import 'package:flutter/material.dart';

import '../../../../utils/logger_util.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    required this.controller,
    required this.label,
    required this.icon,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    this.validator,
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
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
        LoggerUtil.log("$label field tapped");
      },
      maxLines: maxLines,
      style: const TextStyle(fontSize: 16, height: 1.5),
      validator: validator,
      onChanged: (value) {
        LoggerUtil.log("$label field changed: $value");
      },
    );
  }
}
