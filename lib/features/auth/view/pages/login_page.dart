import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'otp_screen.dart'; // Import the OTP screen

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  String countryCode = '+91';
  bool isPhoneValid = false;

  void _onPhoneChanged() {
    final phone = phoneController.text;
    setState(() {
      isPhoneValid = countryCode == '+91' && phone.length == 10 && RegExp(r'^[0-9]+$').hasMatch(phone);
    });
  }

  @override
  void initState() {
    super.initState();
    phoneController.addListener(_onPhoneChanged);
  }

  @override
  void dispose() {
    phoneController.removeListener(_onPhoneChanged);
    phoneController.dispose();
    super.dispose();
  }

  void _navigateToOTPScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OTPScreen(phoneNumber: '$countryCode ${phoneController.text}'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'Welcome !',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Enter your phone number to get started',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 32),
            Container(
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
                      controller: phoneController,
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
            ),
            Spacer(),
            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isPhoneValid ? _navigateToOTPScreen : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(131, 78, 235, 0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
