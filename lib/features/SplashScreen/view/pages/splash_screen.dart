import 'package:flutter/material.dart';
import 'dart:async';
import 'package:chitbox_app/routes/app_routes.dart';

import '../widgets/government_logo_widget.dart';
import '../widgets/logo_widget.dart';
import '../widgets/partner_logos_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(), // Pushes everything to the bottom except the logo
          LogoWidget(height: 250), // Using reusable LogoWidget
          const Spacer(), // Pushes everything to the top except the logo
          const SizedBox(height: 20),
          GovernmentLogoWidget(size: 100), // Using reusable GovernmentLogoWidget
          const SizedBox(height: 20),
          PartnerLogosWidget(size: 50), // Using reusable PartnerLogosWidget
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
