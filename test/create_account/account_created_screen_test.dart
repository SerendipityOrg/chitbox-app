import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chitbox_app/features/home/DashboardScreen.dart';
import 'package:chitbox_app/features/Create_Account/view/pages/AccountCreatedScreen.dart';

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
