import 'package:flutter/material.dart';
import 'package:flutter_task_manager/core/app_export.dart';
import 'package:flutter_task_manager/presentation/welcome_screen/welcome_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('welcome screen ...', (tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: {
        AppRoutes.welcomeScreen: (context) => const WelcomeScreen(),
      },
      home: const WelcomeScreen(),
    ));
    await tester.pump();

    expect(find.text('Sign Up'), findsOneWidget);
  });
}
