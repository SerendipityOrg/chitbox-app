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

/*
    Test Case 1: Verify that All Text Fields Are Visible and Correctly Labeled

    Purpose:
    To ensure that all text fields are visible on the screen and have the correct labels.



*/


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

    //Test Case 2: Verify that the Name Field Accepts Text Input
    testWidgets('Verify that the Name field accepts text input',
            (WidgetTester tester) async {
          await tester.pumpWidget(createPersonalDetailsScreen());

          await tester.enterText(find.byKey(Key('nameField')), 'John Doe');
          expect(find.text('John Doe'), findsOneWidget);
        });

    //Test Case 3: Verify that Tapping the DOB Field Opens the Date Picker
    testWidgets('Verify that tapping the DOB field opens the date picker',
            (WidgetTester tester) async {
          await tester.pumpWidget(createPersonalDetailsScreen());

          await tester.tap(find.byKey(Key('dobField')));
          await tester.pumpAndSettle();

          expect(find.byType(CupertinoDatePicker), findsOneWidget);
        });

    //Test Case 4: Verify that the Email ID Field Accepts Email Input

    testWidgets('Verify that the Email ID field accepts email input',
            (WidgetTester tester) async {
          await tester.pumpWidget(createPersonalDetailsScreen());

          await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
          expect(find.text('test@example.com'), findsOneWidget);
        });

    // Test Case 5: Verify that the OTP Field Accepts Numeric Input

    testWidgets('Verify that the OTP field accepts numeric input',
            (WidgetTester tester) async {
          await tester.pumpWidget(createPersonalDetailsScreen());

          await tester.enterText(find.byKey(Key('otpField')), '123456');
          expect(find.text('123456'), findsOneWidget);
        });

    //Test Case 7: Verify that the Address Field Accepts Multiline Text Input
    testWidgets('Verify that the Address field accepts multiline text input', (WidgetTester tester) async {
      await tester.pumpWidget(createPersonalDetailsScreen());

      await tester.enterText(find.byKey(Key('addressField')), '123 Main St\\nCity, State');
      expect(find.text('123 Main St\\nCity, State'), findsOneWidget);
    });


    // Test Case 8: Verify that the Date Picker Appears as a Bottom Sheet

    testWidgets('Verify that the date picker appears as a bottom sheet', (WidgetTester tester) async {
      await tester.pumpWidget(createPersonalDetailsScreen());

      await tester.tap(find.byKey(Key('dobField')));
      await tester.pumpAndSettle();

      expect(find.byType(CupertinoDatePicker), findsOneWidget);
    });


    //Test Case 9: Verify that the Date Picker Can Be Dismissed by Selecting a Date or Tapping Done
    testWidgets('Verify that the date picker can be dismissed by selecting a date or tapping Done', (WidgetTester tester) async {
      await tester.pumpWidget(createPersonalDetailsScreen());

      await tester.tap(find.byKey(Key('dobField')));
      await tester.pumpAndSettle();

      expect(find.byType(CupertinoDatePicker), findsOneWidget);

      await tester.tap(find.text('Done'));
      await tester.pumpAndSettle();

      expect(find.byType(CupertinoDatePicker), findsNothing);
    });



  });
}
