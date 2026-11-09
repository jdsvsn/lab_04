import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab_04/main.dart';

void main() {
  testWidgets('Menu lists the three items', (WidgetTester tester) async {
    await tester.pumpWidget(const PizzaStoreApp());
    await tester.pumpAndSettle();

    expect(find.text('Vegetable Pizza'), findsOneWidget);
    expect(find.text('Cheese Pizza'), findsOneWidget);
    expect(find.text('Box of Fries'), findsOneWidget);
  });

  testWidgets('Tapping a card opens its detail screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PizzaStoreApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Cheese Pizza'));
    await tester.pumpAndSettle();

    expect(
      find.text('Classic mozzarella and cheddar, baked golden and bubbly.'),
      findsOneWidget,
    );
    expect(find.text('RM 12.50'), findsOneWidget);
  });

  testWidgets('Back button returns to the menu', (WidgetTester tester) async {
    await tester.pumpWidget(const PizzaStoreApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Box of Fries'));
    await tester.pumpAndSettle();
    expect(find.text('Our Menu'), findsNothing);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.text('Our Menu'), findsOneWidget);
    expect(find.text('Vegetable Pizza'), findsOneWidget);
  });
}
