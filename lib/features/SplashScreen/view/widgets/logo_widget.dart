import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double height;

  const LogoWidget({Key? key, this.height = 250}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/logos/Screen_1_Splash_Screen/chitbox_logo.png",
        height: height,
      ),
    );
  }
}
