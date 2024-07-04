import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chitbox_app/features/SplashScreen/view/widgets/logo_widget.dart';
import 'package:chitbox_app/features/SplashScreen/view/widgets/government_logo_widget.dart';
import 'package:chitbox_app/features/SplashScreen/view/widgets/partner_logos_widget.dart';

void main() {
  testWidgets('LogoWidget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: LogoWidget(height: 250))));
    expect(find.byType(LogoWidget), findsOneWidget);
  });

  testWidgets('GovernmentLogoWidget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: GovernmentLogoWidget(size: 100))));
    expect(find.byType(GovernmentLogoWidget), findsOneWidget);
  });

  testWidgets('PartnerLogosWidget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: PartnerLogosWidget(size: 50))));
    expect(find.byType(PartnerLogosWidget), findsOneWidget);
  });
}
