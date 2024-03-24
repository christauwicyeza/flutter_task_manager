import 'package:flutter/material.dart';
import 'package:flutter_task_manager/core/app_export.dart';
import 'package:flutter_task_manager/presentation/welcome_screen/welcome_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Testing welcome screen sign up button', (tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: {
        AppRoutes.welcomeScreen: (context) => const WelcomeScreen(),
      },
      home: const WelcomeScreen(),
    ));
    await tester.pump();

    expect(find.widgetWithText(ElevatedButton, "Sign up"), findsOneWidget);
  });

  testWidgets('Testing welcome screen', (tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: {
        AppRoutes.welcomeScreen: (context) => const WelcomeScreen(),
      },
      home: const WelcomeScreen(),
    ));
    await tester.pump();

    expect(find.widgetWithText(ElevatedButton, "Sign up"), findsOneWidget);
    // expect(find.byKey(const ValueKey('login')), findsOneWidget);
  });
}
