import 'package:flutter/material.dart';
import 'package:flutter_task_manager/presentation/logi_in_screen/logi_in_screen.dart';
import 'package:flutter_task_manager/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:flutter_test/flutter_test.dart';

class AppRoutes {
  static const String loginScreen = '/login';
  static const String signUpScreen = '/signup';
}

void main() {
  group("Sign up screen tests", () {
    final emailFieldKey = find.byKey(const ValueKey('emailTextFieldKey'));
    testWidgets('Testing email fields', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          routes: {
            AppRoutes.loginScreen: (context) => LogiInScreen(),
            AppRoutes.signUpScreen: (context) => SignUpScreen(),
          },
          home: SignUpScreen(),
        ),
      );
      await tester.enterText(emailFieldKey, "my email");
      await tester.pump();

      expect(emailFieldKey, findsOneWidget);
      expect(find.text("my email"), findsOneWidget);
    });
  });

  group("Sign up screen tests", () {
    final usernameTextFieldKey =
        find.byKey(const ValueKey('usernameTextFieldKey'));
    testWidgets('Testing username Fields', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          routes: {
            AppRoutes.loginScreen: (context) => LogiInScreen(),
            AppRoutes.signUpScreen: (context) => SignUpScreen(),
          },
          home: SignUpScreen(),
        ),
      );
      await tester.enterText(usernameTextFieldKey, "my user name");
      await tester.pump();

      expect(usernameTextFieldKey, findsOneWidget);
      expect(find.text("my user name"), findsOneWidget);
    });
  });

  group("Sign up screen tests", () {
    final passwordTextFieldKey =
        find.byKey(const ValueKey('passwordTextFieldKey'));
    testWidgets('Testing password Fields', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          routes: {
            AppRoutes.loginScreen: (context) => LogiInScreen(),
            AppRoutes.signUpScreen: (context) => SignUpScreen(),
          },
          home: SignUpScreen(),
        ),
      );
      await tester.enterText(passwordTextFieldKey, "my password");
      await tester.pump();

      expect(passwordTextFieldKey, findsOneWidget);
      expect(find.text("my password"), findsOneWidget);
    });
  });
}
