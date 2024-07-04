import 'package:chitbox_app/features/Create_Account/view/widgets/description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  group('DescriptionWidget Tests', () {
    testWidgets('renders with the correct text', (WidgetTester tester) async {
      const descriptionText = 'Chitbox is an old fashioned community finance platform that modernizes the traditional savings clubs. It provides easy management of chit funds, peer to peer lending, financial analytics, and efficient fund management, enhancing trust and transparency for participants and operators.';
      
      // Build the DescriptionWidget widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DescriptionWidget(text: descriptionText),
          ),
        ),
      );

      // Verify the DescriptionWidget displays the correct text
      expect(find.text(descriptionText), findsOneWidget);
    });

    testWidgets('renders with correct style', (WidgetTester tester) async {
      const descriptionText = 'Chitbox is an old fashioned community finance platform that modernizes the traditional savings clubs. It provides easy management of chit funds, peer to peer lending, financial analytics, and efficient fund management, enhancing trust and transparency for participants and operators.';
      
      // Build the DescriptionWidget widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DescriptionWidget(text: descriptionText),
          ),
        ),
      );

      // Verify the text style
      final textWidget = tester.widget<Text>(find.text(descriptionText));
      expect(textWidget.style?.fontSize, 14);
      expect(textWidget.style?.color, Colors.black87);
    });
  });
}
