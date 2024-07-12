// import 'package:chitbox_app/features/auth/view/pages/otp_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart'; // Ensure the path is correct for your project
// import 'package:pin_code_fields/pin_code_fields.dart';

// void main() {
//   // Group all test cases related to the OTP Verification Screen
//   group('OTP Verification Screen Tests', () {
//     // Test the visibility of the instruction text
//     testWidgets('Test the visibility of the instruction text', (WidgetTester tester) async {
//       await _testInstructionTextVisibility(tester);
//     });

//     // Test the visibility and functionality of the OTP input fields
//     testWidgets('Test the visibility and functionality of the OTP input fields', (WidgetTester tester) async {
//       await _testOTPInputFields(tester);
//     });

//     // Test the visibility and functionality of the Continue button
//     testWidgets('Test the visibility and functionality of the Continue button', (WidgetTester tester) async {
//       await _testContinueButtonFunctionality(tester);
//     });
//   });
// }

// // Function to test the visibility of the instruction text
// Future<void> _testInstructionTextVisibility(WidgetTester tester) async {
//   // Arrange: Pump the OTPScreen widget
//   await tester.pumpWidget(MaterialApp(home: OTPScreen(phoneNumber: '+91 123 456 7890')));

//   // Assert: Verify the instruction text is displayed correctly
//   expect(find.text('Please enter the verification code'), findsOneWidget);

//   // Assert: Verify the phone number text is displayed correctly
//   expect(find.text('sent on +91 123 456 7890'), findsOneWidget);
// }

// // Function to test the visibility and functionality of the OTP input fields
// Future<void> _testOTPInputFields(WidgetTester tester) async {
//   // Arrange: Pump the OTPScreen widget
//   await tester.pumpWidget(MaterialApp(home: OTPScreen(phoneNumber: '+91 123 456 7890')));

//   // Assert: Verify the OTP input fields are visible
//   expect(find.byType(PinCodeTextField), findsOneWidget);

//   // Act: Enter a valid OTP
//   await tester.enterText(find.byType(PinCodeTextField), '1234');

//   // Assert: Verify the OTP input fields accept numeric input
//   expect(find.text('1234'), findsOneWidget);
// }

// // Function to test the visibility and functionality of the Continue button
// Future<void> _testContinueButtonFunctionality(WidgetTester tester) async {
//   // Arrange: Pump the OTPScreen widget
//   await tester.pumpWidget(MaterialApp(home: OTPScreen(phoneNumber: '+91 123 456 7890')));

//   // Assert: Verify the Continue button is visible
//   final continueButton = find.byType(ElevatedButton);
//   expect(continueButton, findsOneWidget);

//   // Act: Enter a valid OTP
//   await tester.enterText(find.byType(PinCodeTextField), '1234');
//   await tester.pump();

//   // Assert: Verify the Continue button is enabled only when a valid OTP is entered
//   expect(tester.widget<ElevatedButton>(continueButton).enabled, isTrue);

//   // Act: Tap the Continue button
//   await tester.tap(continueButton);
//   await tester.pumpAndSettle();

//   // Assert: Verify that tapping the Continue button triggers the OTP verification logic
//   // (Assuming there is some verification logic to check here)
//   // For example, you can check if a certain function is called or a certain state is reached.
//   // Since we don't have the actual verification logic here, we'll assume it redirects to another screen.
//   expect(find.text('Next Screen'), findsOneWidget);
// }
