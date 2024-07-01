import 'package:chitbox_app/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => OnboardingScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(), // Pushes everything to the bottom except the logo
          Center(
            child: Image.asset(
              "assets/logos/Screen_1_Splash_Screen/chitbox_logo.png",
              height: 250, // Adjusted to fit within typical screen size
            ),
          ),
          Spacer(), // Pushes everything to the top except the logo
          const SizedBox(height: 20),
          Center(
            child: Image.asset(
              'assets/logos/Screen_1_Splash_Screen/govt_karnataka.png',
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/logos/Screen_1_Splash_Screen/mca_logo.png',
                  width: 50, height: 50),
              const SizedBox(width: 10),
              Image.asset(
                  'assets/logos/Screen_1_Splash_Screen/BharatInclusive_Intiative.png',
                  width: 50,
                  height: 50),
              const SizedBox(width: 10),
              Image.asset('assets/logos/Screen_1_Splash_Screen/DPIIT.png',
                  width: 50, height: 50),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
