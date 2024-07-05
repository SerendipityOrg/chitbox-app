import 'package:flutter/material.dart';

class CodeBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode currentFocus;
  final FocusNode nextFocus;
  final ValueChanged<String> onChanged;

  const CodeBox({
    Key? key,
    required this.controller,
    required this.currentFocus,
    required this.nextFocus,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.purple[700],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onChanged: (value) => onChanged(value),
      ),
    );
  }
}
