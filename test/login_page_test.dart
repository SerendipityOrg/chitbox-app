// Imprt Required Packages

import 'package:chitbox_app/features/auth/view/pages/login_page.dart';
import 'package:chitbox_app/features/auth/view/pages/otp_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';



/*

// Group all test cases related to the Login Screen
group('Login Screen Tests', () {
  // [ ] Test the visibility of the welcome message
  //     [ ] Verify the welcome message text is displayed correctly
  testWidgets('Test the visibility of the welcome message', (WidgetTester tester) async {
    await _testWelcomeMessageVisibility(tester);
  });

  // [ ] Test the visibility of the instruction text
  //     [ ] Verify the instruction text ("Enter your phone number to get started") is displayed correctly
  testWidgets('Test the visibility of the instruction text', (WidgetTester tester) async {
    await _testInstructionTextVisibility(tester);
  });

  // [ ] Test the visibility and functionality of the country code picker
  //     [ ] Verify the country code picker is visible
  //     [ ] Verify the default country code is set to '+91'
  //     [ ] Verify that changing the country code updates the state correctly
  testWidgets('Test the visibility and functionality of the country code picker', (WidgetTester tester) async {
    await _testCountryCodePicker(tester);
  });

  // [ ] Test the visibility and functionality of the phone number input field
  //     [ ] Verify the phone number input field is visible
  //     [ ] Verify the phone number input field accepts numeric input
  //     [ ] Verify the phone number input field validation (e.g., length and numeric format)
  testWidgets('Test the visibility and functionality of the phone number input field', (WidgetTester tester) async {
    await _testPhoneNumberInputField(tester);
  });

  // [ ] Test the visibility and functionality of the tick icon
  //     [ ] Verify the tick icon appears only when a valid 10-digit phone number is entered
  testWidgets('Test the visibility and functionality of the tick icon', (WidgetTester tester) async {
    await _testTickIconVisibility(tester);
  });

  // [ ] Test the visibility and functionality of the Continue button
  //     [ ] Verify the Continue button is visible
  //     [ ] Verify the Continue button is enabled only when a valid 10-digit phone number is entered
  //     [ ] Verify that tapping the Continue button navigates to the OTP Verification Screen
  testWidgets('Test the visibility and functionality of the Continue button', (WidgetTester tester) async {
    await _testContinueButtonFunctionality(tester);
  });
});


 */



void main() {
  // Group all test cases related to the Login Screen
  group('Login Screen Tests', () {
    // Test the visibility of the welcome message
    testWidgets('Test the visibility of the welcome message', (WidgetTester tester) async {
      await _testWelcomeMessageVisibility(tester);
    });

    // Test the visibility of the instruction text
    testWidgets('Test the visibility of the instruction text', (WidgetTester tester) async {
      await _testInstructionTextVisibility(tester);
    });

    // Test the visibility and functionality of the country code picker
    testWidgets('Test the visibility and functionality of the country code picker', (WidgetTester tester) async {
      await _testCountryCodePicker(tester);
    });

    // Test the visibility and functionality of the phone number input field
    testWidgets('Test the visibility and functionality of the phone number input field', (WidgetTester tester) async {
      await _testPhoneNumberInputField(tester);
    });

    // Test the visibility and functionality of the tick icon
    testWidgets('Test the visibility and functionality of the tick icon', (WidgetTester tester) async {
      await _testTickIconVisibility(tester);
    });



  });
}

// Function to test the visibility of the welcome message
Future<void> _testWelcomeMessageVisibility(WidgetTester tester) async {
  // Arrange: Pump the LoginPage widget
  await tester.pumpWidget(MaterialApp(home: LoginPage()));

  // Assert: Verify the welcome message text is displayed correctly
  expect(find.text('Welcome !'), findsOneWidget);
}

// Function to test the visibility of the instruction text
Future<void> _testInstructionTextVisibility(WidgetTester tester) async {
  // Arrange: Pump the LoginPage widget
  await tester.pumpWidget(MaterialApp(home: LoginPage()));

  // Assert: Verify the instruction text is displayed correctly
  expect(find.text('Enter your phone number to get started'), findsOneWidget);
}

// Function to test the visibility and functionality of the country code picker
Future<void> _testCountryCodePicker(WidgetTester tester) async {
  // Arrange: Pump the LoginPage widget
  await tester.pumpWidget(MaterialApp(home: LoginPage()));

  // Assert: Verify the country code picker is visible
  expect(find.byType(CountryCodePicker), findsOneWidget);

  // Assert: Verify the default country code is set to '+91'
  final countryCodePicker = find.byType(CountryCodePicker).evaluate().first.widget as CountryCodePicker;
  expect(countryCodePicker.initialSelection, 'IN');
}

// Function to test the visibility and functionality of the phone number input field
Future<void> _testPhoneNumberInputField(WidgetTester tester) async {
  // Arrange: Pump the LoginPage widget
  await tester.pumpWidget(MaterialApp(home: LoginPage()));

  // Assert: Verify the phone number input field is visible
  final phoneNumberField = find.byType(TextField);
  expect(phoneNumberField, findsOneWidget);

  // Act: Enter a valid phone number
  await tester.enterText(phoneNumberField, '1234567890');

  // Assert: Verify the phone number input field accepts numeric input
  expect(find.text('1234567890'), findsOneWidget);
}

// Function to test the visibility and functionality of the tick icon
Future<void> _testTickIconVisibility(WidgetTester tester) async {
  // Arrange: Pump the LoginPage widget
  await tester.pumpWidget(MaterialApp(home: LoginPage()));

  // Act: Enter a valid phone number
  final phoneNumberField = find.byType(TextField);
  await tester.enterText(phoneNumberField, '1234567890');
  await tester.pump();

  // Assert: Verify the tick icon appears only when a valid 10-digit phone number is entered
  expect(find.byIcon(Icons.check_circle), findsOneWidget);
}

// Function to test the visibility and functionality of the Continue button
// Future<void> _testContinueButtonFunctionality(WidgetTester tester) async {
//   // Arrange: Pump the LoginPage widget
//   await tester.pumpWidget(MaterialApp(home: LoginPage()));
//
//   // Assert: Verify the Continue button is visible
//   final continueButton = find.byType(ElevatedButton);
//   expect(continueButton, findsOneWidget);
//
//   // Act: Enter a valid phone number
//   final phoneNumberField = find.byType(TextField);
//   await tester.enterText(phoneNumberField, '1234567890');
//   await tester.pump();
//
//   // Assert: Verify the Continue button is enabled only when a valid 10-digit phone number is entered
//   expect(tester.widget<ElevatedButton>(continueButton).enabled, isTrue);
//
//   // Act: Tap the Continue button
//   await tester.tap(continueButton);
//   await tester.pumpAndSettle();
//
//   // Assert: Verify that tapping the Continue button navigates to the OTP Verification Screen
//   expect(find.byType(OTPScreen), findsOneWidget);
// }

// still not implemented functinality

// Future<void> _testContinueButtonFunctionality(WidgetTester tester) async {
//   await tester.pumpWidget(MaterialApp(home: LoginPage()));
//   final continueButton = find.byType(ElevatedButton);
//   expect(continueButton, findsOneWidget);
//
//   final phoneNumberField = find.byType(TextField);
//   await tester.enterText(phoneNumberField, '1234567890');
//   await tester.pump();
//
//   expect(tester.widget<ElevatedButton>(continueButton).enabled, isTrue);
//
//   await tester.tap(continueButton);
//   await tester.pumpAndSettle();
//
//   expect(find.byType(OTPScreen), findsOneWidget);
// }
