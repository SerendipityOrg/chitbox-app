import 'package:chitbox_app/features/home/DashboardScreen.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final String message;
  final Widget? nextScreen;

  const SuccessDialog({
    Key? key,
    required this.message,
    this.nextScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logos/success_information.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            if (nextScreen != null)
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                },
                child: const Text('Continue'),
              ),
          ],
        ),
      ),
    );
  }
}
