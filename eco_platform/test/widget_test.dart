import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:eco_platform/screens/login_screen.dart';

void main() {
  testWidgets('LoginScreen renders and accepts input', (
    WidgetTester tester,
  ) async {
    // Load the LoginScreen widget inside a MaterialApp (needed for navigation)
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    // Locate the text fields and login button
    final usernameField = find.widgetWithText(TextField, 'Username');
    final passwordField = find.widgetWithText(TextField, 'Password');
    final loginButton = find.widgetWithText(ElevatedButton, 'Login');

    // Expect all widgets to be found
    expect(usernameField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(loginButton, findsOneWidget);

    // Enter values in text fields
    await tester.enterText(usernameField, 'testuser');
    await tester.enterText(passwordField, 'password123');

    // Tap the login button
    await tester.tap(loginButton);

    // Allow animations, rebuilds, etc.
    await tester.pump();

    // The actual login logic uses an API call — which is not mocked here
    // So we just verify input interactions; for real tests, use mock API services
  });
}
