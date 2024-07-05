import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class PhoneFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function(bool) onChanged;

  PhoneFieldWidget({required this.controller, required this.onChanged});

  @override
  _PhoneFieldWidgetState createState() => _PhoneFieldWidgetState();
}

class _PhoneFieldWidgetState extends State<PhoneFieldWidget> {
  String countryCode = '+91';
  bool isPhoneValid = false;

  void _onPhoneChanged() {
    final phone = widget.controller.text;
    setState(() {
      isPhoneValid = countryCode == '+91' && phone.length == 10 && RegExp(r'^[0-9]+$').hasMatch(phone);
      widget.onChanged(isPhoneValid);
    });
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onPhoneChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onPhoneChanged);
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          CountryCodePicker(
            onChanged: (code) {
              setState(() {
                countryCode = code.dialCode ?? '+91';
                _onPhoneChanged();
              });
            },
            initialSelection: 'IN',
            favorite: ['+91', 'IN'],
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
          ),
          Expanded(
            child: TextField(
              controller: widget.controller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Phone number',
                border: InputBorder.none,
              ),
            ),
          ),
          if (isPhoneValid)
            Icon(Icons.check_circle, color: Colors.green),
        ],
      ),
    );
  }
}
