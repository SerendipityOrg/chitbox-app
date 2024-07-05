import 'package:chitbox_app/features/auth/view/pages/AccountCreatedScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chitbox_app/features/home/DashboardScreen.dart';

void main() {
  group('AccountCreatedScreen Tests', () {
    

    testWidgets('Verify navigation to DashboardScreen after delay', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: const AccountCreatedScreen(),
        routes: {
          '/dashboard': (context) => DashboardScreen(),
        },
      ));

      // Initial screen
      expect(find.byType(AccountCreatedScreen), findsOneWidget);
      expect(find.byType(DashboardScreen), findsNothing);

      // Fast forward the timer
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // After delay, DashboardScreen should be shown
      expect(find.byType(AccountCreatedScreen), findsNothing);
      expect(find.byType(DashboardScreen), findsOneWidget);
    });
  });
}
