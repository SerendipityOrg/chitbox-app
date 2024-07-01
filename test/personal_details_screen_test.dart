import 'package:chitbox_app/features/Create_Account/PersonalDetails_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  // Helper function to create the widget under test
  Widget createPersonalDetailsScreen() => MaterialApp(
    home: PersonalDetailsScreen(),
  );

  group('Personal Details Screen Tests', ()  {
    testWidgets('Verify that all text fields are visible and correctly labeled',
            (WidgetTester tester) async {
          await tester.pumpWidget(createPersonalDetailsScreen());

          expect(find.byType(TextFormField), findsNWidgets(5));
          expect(find.text('Name as per Aadhar card'), findsOneWidget);
          expect(find.text('DOB'), findsOneWidget);
          expect(find.text('Email ID'), findsOneWidget);
          expect(find.text('Enter OTP'), findsOneWidget);
          expect(find.text('Address for communication'), findsOneWidget);
        });

    //Test Case 3: Verify that the Name Field Accepts Text Input
    testWidgets('Verify that the Name field accepts text input',
            (WidgetTester tester) async {
          await tester.pumpWidget(createPersonalDetailsScreen());

          await tester.enterText(find.byKey(Key('nameField')), 'John Doe');
          expect(find.text('John Doe'), findsOneWidget);
        });

    //Test Case 4: Verify that Tapping the DOB Field Opens the Date Picker
    testWidgets('Verify that tapping the DOB field opens the date picker',
            (WidgetTester tester) async {
          await tester.pumpWidget(createPersonalDetailsScreen());

          await tester.tap(find.byKey(Key('dobField')));
          await tester.pumpAndSettle();

          expect(find.byType(CupertinoDatePicker), findsOneWidget);
        });

    //Test Case 5: Verify that the Email ID Field Accepts Email Input

    testWidgets('Verify that the Email ID field accepts email input',
            (WidgetTester tester) async {
          await tester.pumpWidget(createPersonalDetailsScreen());

          await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
          expect(find.text('test@example.com'), findsOneWidget);
        });

    // Test Case 6: Verify that the OTP Field Accepts Numeric Input

    testWidgets('Verify that the OTP field accepts numeric input',
            (WidgetTester tester) async {
          await tester.pumpWidget(createPersonalDetailsScreen());

          await tester.enterText(find.byKey(Key('otpField')), '123456');
          expect(find.text('123456'), findsOneWidget);
        });

    


  });
}
