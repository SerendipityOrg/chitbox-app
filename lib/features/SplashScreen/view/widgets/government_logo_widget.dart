import 'package:flutter/material.dart';

class GovernmentLogoWidget extends StatelessWidget {
  final double size;

  const GovernmentLogoWidget({Key? key, this.size = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/logos/Screen_1_Splash_Screen/govt_karnataka.png',
        width: size,
        height: size,
      ),
    );
  }
}
