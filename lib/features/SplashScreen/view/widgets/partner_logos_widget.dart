import 'package:flutter/material.dart';

class PartnerLogosWidget extends StatelessWidget {
  final double size;

  const PartnerLogosWidget({Key? key, this.size = 50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/logos/Screen_1_Splash_Screen/mca_logo.png',
            width: size, height: size),
        const SizedBox(width: 10),
        Image.asset(
            'assets/logos/Screen_1_Splash_Screen/BharatInclusive_Intiative.png',
            width: size, height: size),
        const SizedBox(width: 10),
        Image.asset('assets/logos/Screen_1_Splash_Screen/DPIIT.png',
            width: size, height: size),
      ],
    );
  }
}
