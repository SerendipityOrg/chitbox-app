import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:chitbox_app/routes/app_routes.dart';
import 'package:chitbox_app/utils/strings.dart';

import '../widgets/custom_button.dart';
import '../widgets/description_widget.dart';
import '../widgets/title_widget.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBE6), // Light cream background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Image.asset(
                'assets/logos/onerupee.png', // Make sure to add this image to your assets
                width: 150,
                height: 150,
              ),
              SizedBox(height: 105),
              AspectRatio(
                aspectRatio: 1, // This ensures a square shape
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TitleWidget(text: AppStrings.chitboxTitle),
                      DescriptionWidget(
                        text: AppStrings.chitboxDescription,
                      ),
                      CustomButton(
                        text: AppStrings.createAccount,
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.invitation);
                        },
                      ),
                      RichText(
                        text: TextSpan(
                          text: AppStrings.alreadyHaveAccount,
                          style: const TextStyle(color: Colors.black87),
                          children: [
                            TextSpan(
                              text: AppStrings.logIn,
                              style: const TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, AppRoutes.login);
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
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
