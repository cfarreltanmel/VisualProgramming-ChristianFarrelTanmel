// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:borrowing_item_app/features/borrowed_items/presentation/home_screen.dart';

void main() {
  testWidgets('HomeScreen loads title and floating action buttons', (
    WidgetTester tester,
  ) async {
    // 1. Build our app UI inside the test environment
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(
          currentThemeMode: ThemeMode.system,
          onThemeModeChanged: (mode) {},
        ),
      ),
    );

    // 2. Verify that the AppBar title is displayed
    expect(find.text('Borrowed Items'), findsOneWidget);

    // 3. Verify that the 'Add Item' action button is present
    expect(find.text('Add Item'), findsOneWidget);

    // 4. Verify that the theme palette icon exists
    expect(find.byIcon(Icons.palette_outlined), findsOneWidget);
  });
}
