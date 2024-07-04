import 'package:chitbox_app/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chitbox_app/features/home/DashboardScreen.dart';

void main() {
  testWidgets('Verify the presence of Bottom Navigation Bar', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DashboardScreen()));

    expect(find.byType(BottomNavBar), findsOneWidget);
  });

  testWidgets('Verify navigation between tabs', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DashboardScreen()));

    // Initial tab (New Chits)
    expect(find.text('New Chits Screen'), findsOneWidget);

    // Tap on My Chits tab
    await tester.tap(find.text('My Chits'));
    await tester.pump();
    expect(find.text('My Chits Screen'), findsOneWidget);

    // Tap on Auction tab
    await tester.tap(find.text('Auction'));
    await tester.pump();
    expect(find.text('Auction Screen'), findsOneWidget);

    // Tap on Profile tab
    await tester.tap(find.text('Profile'));
    await tester.pump();
    expect(find.text('Profile Screen'), findsOneWidget);
  });

  testWidgets('Verify the correct screen is displayed when a tab is selected', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DashboardScreen()));

    // Initial tab (New Chits)
    expect(find.text('New Chits Screen'), findsOneWidget);

    // Tap on My Chits tab
    await tester.tap(find.text('My Chits'));
    await tester.pump();
    expect(find.text('My Chits Screen'), findsOneWidget);

    // Tap on Auction tab
    await tester.tap(find.text('Auction'));
    await tester.pump();
    expect(find.text('Auction Screen'), findsOneWidget);

    // Tap on Profile tab
    await tester.tap(find.text('Profile'));
    await tester.pump();
    expect(find.text('Profile Screen'), findsOneWidget);
  });
}
