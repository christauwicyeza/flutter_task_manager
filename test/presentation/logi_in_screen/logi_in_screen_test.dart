import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_task_manager/presentation/logi_in_screen/logi_in_screen.dart';
import 'package:flutter_task_manager/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:flutter_test/flutter_test.dart';

class AppRoutes {
  static const String loginScreen = '/login';
  static const String signUpScreen = '/signup';
}

void main() {
  group("Login up screen tests", () {
    final emailFieldKey = find.byKey(const ValueKey('emailFieldKey'));
    testWidgets('Testing email fields', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          routes: {
            AppRoutes.loginScreen: (context) => LogiInScreen(),
            AppRoutes.signUpScreen: (context) => SignUpScreen(),
          },
          home: LogiInScreen(),
        ),
      );
      await tester.enterText(emailFieldKey, "my email");
      await tester.pump();

      expect(emailFieldKey, findsOneWidget);
      expect(find.text("my email"), findsOneWidget);
    });
  });

  group("Login up screen tests", () {
    final passwordTextFieldKey = find.byKey(const ValueKey('passwordFieldKey'));
    testWidgets('Testing password Fields', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          routes: {
            AppRoutes.loginScreen: (context) => LogiInScreen(),
            AppRoutes.signUpScreen: (context) => SignUpScreen(),
          },
          home: LogiInScreen(),
        ),
      );
      await tester.enterText(passwordTextFieldKey, "my password");
      await tester.pump();

      expect(passwordTextFieldKey, findsOneWidget);
      expect(find.text("my password"), findsOneWidget);
    });
  });

  testWidgets("Log in Button", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LogiInScreen(),
    ));
    await tester.pump();

    expect(find.widgetWithText(ElevatedButton, "Log in"), findsOneWidget);
  });

  testWidgets("Google Button", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LogiInScreen(),
    ));
    await tester.pump();

    expect(find.widgetWithText(ElevatedButton, "Log in with Google"),
        findsOneWidget);
  });
}
