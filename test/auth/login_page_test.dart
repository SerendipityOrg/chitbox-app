import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chitbox_app/features/auth/view/pages/login_page.dart';

void main() {
  group('LoginPage Tests', () {
    testWidgets('Verify UI elements', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginPage()));

      // Check for Welcome text
      expect(find.text('Welcome !'), findsOneWidget);

      // Check for Phone number field
      expect(find.byType(TextField), findsOneWidget);

      // Check for Continue button
      expect(find.text('Continue'), findsOneWidget);
    });

    
  });
}
