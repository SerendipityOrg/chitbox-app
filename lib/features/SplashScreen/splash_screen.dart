import 'package:chitbox_app/main.dart';
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
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const MyApp(),
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/logos/Screen_1_Splash_Screen/chitbox_logo.png",
              height: 550,
            ),
          ),

          // Spacer(), // Spacer to push everything to the center
          // Center(
          //   child: Image.asset(
          //     'assets/logos/Screen_1_Splash_Screen/chitbox_logo.png',
          //   ),
          // ),
          const SizedBox(height: 20),
          Spacer(),
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
