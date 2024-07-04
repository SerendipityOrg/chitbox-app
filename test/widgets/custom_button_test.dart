import 'package:chitbox_app/features/Create_Account/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomButton Tests', () {
    testWidgets('renders with the correct text', (WidgetTester tester) async {
      const buttonText = 'Create account now';
      
      // Build the CustomButton widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: buttonText,
              onPressed: () {},
            ),
          ),
        ),
      );

      // Verify the button displays the correct text
      expect(find.text(buttonText), findsOneWidget);
    });

    testWidgets('triggers onPressed callback when tapped', (WidgetTester tester) async {
      bool buttonPressed = false;

      // Build the CustomButton widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'Create account now',
              onPressed: () {
                buttonPressed = true;
              },
            ),
          ),
        ),
      );

      // Verify the button is present
      expect(find.byType(CustomButton), findsOneWidget);

      // Tap the button
      await tester.tap(find.byType(CustomButton));
      await tester.pumpAndSettle();

      // Verify the button press was registered
      expect(buttonPressed, isTrue);
    });

    testWidgets('renders with custom style', (WidgetTester tester) async {
      // Build the CustomButton widget with custom style
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'Create account now',
              onPressed: () {},
              backgroundColor: Colors.red,
              textColor: Colors.yellow,
            ),
          ),
        ),
      );

      // Verify the button is present
      expect(find.byType(CustomButton), findsOneWidget);

      // Verify the custom styles
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.style?.backgroundColor?.resolve({}), Colors.red);
      expect(button.style?.foregroundColor?.resolve({}), Colors.yellow);
    });
  });
}
