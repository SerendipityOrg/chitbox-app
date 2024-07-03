import 'package:chitbox_app/features/Create_Account/view/pages/PersonalDetails_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
 

  // Test Case 3: Verify the presence of all text form fields.
  testWidgets('Presence of all text form fields', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PersonalDetailsScreen()));

    expect(find.widgetWithText(TextFormField, 'Name as per Aadhar card'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'DOB'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Email ID'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Enter OTP'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Address for communication'), findsOneWidget);
  });

  // Test Case 4: Verify the DOB field opens the date picker.
  testWidgets('DOB field opens date picker', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PersonalDetailsScreen()));

    await tester.tap(find.widgetWithText(TextFormField, 'DOB'));
    await tester.pumpAndSettle();

    expect(find.text('Date Picker'), findsOneWidget);
    await tester.tap(find.text('Done'));
    await tester.pumpAndSettle();
  });
}
