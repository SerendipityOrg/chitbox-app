import 'package:chitbox_app/features/Create_Account/PersonalDetails_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

// Assuming this is in the same file

void main() {
  group('PersonalDetailsScreen', () {
    testWidgets('DOB field updates on date selection', (WidgetTester tester) async {
      // Arrange
      final initialDate = DateTime.now();
      final selectedDate = initialDate.add(const Duration(days: 10));
      final formattedSelectedDate = DateFormat('dd MMMM, yyyy').format(selectedDate);

      // Act
      await tester.pumpWidget(MaterialApp(home: PersonalDetailsScreen()));

      // 1. Verify DOB text field is initially empty
      final dobField = find.byKey(const Key('dobField'));

      expect(await tester.widget<TextFormField>(dobField).text, '');

      // 2. Simulate tapping on DOB text field
      await tester.tap(dobField);
      await tester.pumpAndSettle(); // Added for layout stability

      // 3. Assert that date picker bottom sheet is displayed
      expect(find.byType(CupertinoDatePicker), findsOneWidget);

      // 4. Select a new date using the date picker
      await tester.tap(find.text(DateFormat('yyyy').format(initialDate))); // Tap on the year
      await tester.fling(find.byType(CupertinoDatePicker), Offset(0, 100), 1000); // Scroll down

      await tester.pump();
      await tester.tap(find.text(DateFormat('y').format(selectedDate))); // Select the new year

      // 5. Assert that the selected date is displayed in the DOB text field
      await tester.pump();
      expect(dobField, findsOneWidget);
      final dobText = await tester.widget<TextFormField>(dobField).text;
      expect(dobText, formattedSelectedDate);
    });

  });
}