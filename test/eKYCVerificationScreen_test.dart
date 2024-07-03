import 'package:chitbox_app/features/Create_Account/view/pages/eKYCVerificationScreen.dart';
import 'package:chitbox_app/features/home/DashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  // Test Case 1: Verify AppBar implementation.
  testWidgets('AppBar implementation', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: eKYCVerificationScreen()));
    
    expect(find.text('Verify PAN and Aadhaar'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });

  // Test Case 2: Verify header section.
  testWidgets('Header section', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: eKYCVerificationScreen()));
    
    expect(find.byIcon(Icons.verified_user), findsOneWidget);
    expect(find.text('Verify PAN and Aadhaar'), findsOneWidget);
  });

  // Test Case 3: Verify instruction text.
  testWidgets('Instruction text', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: eKYCVerificationScreen()));
    
    expect(find.text('Kindly provide your PAN'), findsOneWidget);
    expect(find.text('and Aadhaar information for KYC'), findsOneWidget);
  });

  // Test Case 4: Verify PAN input field.
  testWidgets('PAN input field', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: eKYCVerificationScreen()));
    
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('PAN Number'), findsOneWidget);
  });

  // Test Case 5: Verify Aadhaar input field.
  testWidgets('Aadhaar input field', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: eKYCVerificationScreen()));
    
    expect(find.text('Aadhaar Number'), findsOneWidget);
  });

  // Test Case 6: Verify Verify & Continue button.
  testWidgets('Verify & Continue button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: eKYCVerificationScreen()));
    
    expect(find.text('Verify & continue'), findsOneWidget);
  });

  /*
  Validation Logic Test Cases
  */

  // Test Case 7: Verify PAN validation logic.
  testWidgets('PAN validation logic', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: eKYCVerificationScreen()));
    
    await tester.enterText(find.byType(TextField).at(0), 'ABCDE1234F');
    await tester.pump();
    
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
  });

  // Test Case 8: Verify Aadhaar validation logic.
  testWidgets('Aadhaar validation logic', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: eKYCVerificationScreen()));
    
    await tester.enterText(find.byType(TextField).at(1), '123412341234');
    await tester.pump();
    
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
  });

  

  

  /*
  UI Testing: Ensure UI elements are correctly placed and styled.
  */

  testWidgets('UI elements placement and styling', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: eKYCVerificationScreen()));
    
    // Add assertions to verify the placement and styling of UI elements
    expect(find.byIcon(Icons.verified_user), findsOneWidget);
    expect(find.text('Verify PAN and Aadhaar'), findsOneWidget);
    expect(find.text('Kindly provide your PAN'), findsOneWidget);
    expect(find.text('and Aadhaar information for KYC'), findsOneWidget);
    expect(find.text('PAN Number'), findsOneWidget);
    expect(find.text('Aadhaar Number'), findsOneWidget);
    expect(find.text('Verify & continue'), findsOneWidget);
  });

  /*
  Validation Testing: Test PAN and Aadhaar validation logic.
  */

  testWidgets('PAN and Aadhaar validation logic', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: eKYCVerificationScreen()));
    
    await tester.enterText(find.byType(TextField).at(0), 'ABCDE1234F');
    await tester.enterText(find.byType(TextField).at(1), '123412341234');
    await tester.pump();
    
    expect(find.byIcon(Icons.check_circle), findsNWidgets(2));
  });

  /*
  Navigation Testing: Test navigation to Account Created screen and Dashboard screen.
  */

  testWidgets('Navigation to Account Created and Dashboard screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: eKYCVerificationScreen()));
    
    await tester.enterText(find.byType(TextField).at(0), 'ABCDE1234F');
    await tester.enterText(find.byType(TextField).at(1), '123412341234');
    await tester.pump();
    
    await tester.tap(find.text('Verify & continue'));
    await tester.pumpAndSettle();
    
    expect(find.text('Your account has been created\nand KYC verified successfully.'), findsOneWidget);
    
    await tester.pump(Duration(seconds: 15));
    await tester.pumpAndSettle();
    
    expect(find.byType(DashboardScreen), findsOneWidget);
  });
}
