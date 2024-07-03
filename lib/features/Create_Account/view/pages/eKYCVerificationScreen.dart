import 'package:flutter/material.dart';
import 'package:chitbox_app/routes/app_routes.dart';
import 'package:flutter/services.dart';

class eKYCVerificationScreen extends StatefulWidget {
  @override
  _eKYCVerificationScreenState createState() => _eKYCVerificationScreenState();
}

class _eKYCVerificationScreenState extends State<eKYCVerificationScreen> {
  final _panController = TextEditingController();
  final _aadhaarController = TextEditingController();

  bool isPanValid = false;
  bool isAadhaarValid = false;

  @override
  void initState() {
    super.initState();
    _panController.addListener(_validatePan);
    _aadhaarController.addListener(_validateAadhaar);
  }

  void _validatePan() {
    final panRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
    setState(() {
      isPanValid = panRegex.hasMatch(_panController.text);
    });
  }

  void _validateAadhaar() {
    final aadhaarRegex = RegExp(r'^\d{12}$');
    setState(() {
      isAadhaarValid = aadhaarRegex.hasMatch(_aadhaarController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Verify PAN and Aadhaar', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.verified_user, color: Colors.black, size: 30),
                SizedBox(width: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Verify ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'PAN ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Aadhaar',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Kindly provide your PAN',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            Text(
              'and Aadhaar information for KYC',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 24),
            TextField(
              controller: _panController,
              decoration: InputDecoration(
                labelText: 'PAN Number',
                suffixIcon: isPanValid ? Icon(Icons.check_circle, color: Colors.green) : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]')),
                LengthLimitingTextInputFormatter(10),
              ],
              textCapitalization: TextCapitalization.characters,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _aadhaarController,
              decoration: InputDecoration(
                labelText: 'Aadhaar Number',
                suffixIcon: isAadhaarValid ? Icon(Icons.check_circle, color: Colors.green) : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(12),
              ],
            ),
            SizedBox(height: 24),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton(
                  child: Text(
                    'Verify & continue',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: isPanValid && isAadhaarValid
                      ? () {
                    Navigator.pushNamed(context, AppRoutes.accountCreated);
                  }
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _panController.dispose();
    _aadhaarController.dispose();
    super.dispose();
  }
}
