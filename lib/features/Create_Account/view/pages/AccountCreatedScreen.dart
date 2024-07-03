import 'dart:async';
import 'package:chitbox_app/routes/app_routes.dart';
import 'package:chitbox_app/utils/strings.dart';
import 'package:flutter/material.dart';
import '../widgets/success_dialog.dart';

class AccountCreatedScreen extends StatefulWidget {
  const AccountCreatedScreen({super.key});

  @override
  _AccountCreatedScreenState createState() => _AccountCreatedScreenState();
}

class _AccountCreatedScreenState extends State<AccountCreatedScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(AppRoutes.dashboard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 68, 63, 63), // Light grey background
      body: Center(
        child: SuccessDialog(
          message: AppStrings.accountCreatedMessage,
           // Not needed as navigation is handled in initState
        ),
      ),
    );
  }
}
