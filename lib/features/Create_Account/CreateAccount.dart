import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:chitbox_app/features/Create_Account/InvitationScreen.dart';

import '../auth/view/pages/login_page.dart';

class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFBE6), // Light cream background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
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
                      const Text(
                        'CHITBOX',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      const Text(
                        'Chitbox is an old fashioned community finance platform that modernizes the traditional savings clubs. It provides easy management of chit funds, peer to peer lending, financial analytics, and efficient fund management, enhancing trust and transparency for participants and operators.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                      ElevatedButton(
                        child: Text('Create account now'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InvitationScreen(),
                            ),
                          );
                        },
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(color: Colors.black87),
                          children: [
                            TextSpan(
                              text: 'Log in',
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
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
