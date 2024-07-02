import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async'; // Importing for Timer

class OTPScreen extends StatefulWidget {
  final String phoneNumber;

  OTPScreen({required this.phoneNumber});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  late Timer _timer;
  int _start = 35;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void resetTimer() {
    setState(() {
      _start = 35;
    });
    startTimer();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView( // Added SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/logos/otp_verification.png', // Add your image asset here
                  height: 150,
                ),
              ),
              SizedBox(height: 32),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'OTP ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8E2DE2),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Verification',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Please enter the verification code',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'sent on ${widget.phoneNumber}',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              PinCodeTextField(
                appContext: context,
                length: 4,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  inactiveColor: Colors.grey,
                  selectedColor: Color(0xFF8E2DE2),
                  activeColor: Colors.grey,
                ),
                controller: otpController,
                onChanged: (value) {},
              ),
              SizedBox(height: 24),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle OTP verification here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8E2DE2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Verify OTP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: _start == 0 ? resetTimer : null, // Add gesture detection for resetting the timer
                  child: Text(
                    _start == 0 ? 'Resend OTP' : 'Resend OTP in $_start Seconds',
                    style: TextStyle(fontSize: 16, color: Color(0xFF8E2DE2)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
