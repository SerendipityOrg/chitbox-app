import 'package:chitbox_app/features/auth/view/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TitleWidget Tests', () {
    testWidgets('renders with the correct text', (WidgetTester tester) async {
      const titleText = 'CHITBOX';
      
      // Build the TitleWidget widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TitleWidget(text: titleText),
          ),
        ),
      );

      // Verify the TitleWidget displays the correct text
      expect(find.text(titleText), findsOneWidget);
    });

    testWidgets('renders with correct style', (WidgetTester tester) async {
      const titleText = 'CHITBOX';
      
      // Build the TitleWidget widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TitleWidget(text: titleText),
          ),
        ),
      );

      // Verify the text style
      final textWidget = tester.widget<Text>(find.text(titleText));
      expect(textWidget.style?.fontSize, 24);
      expect(textWidget.style?.fontWeight, FontWeight.bold);
      expect(textWidget.style?.color, Colors.purple);
    });
  });
}
