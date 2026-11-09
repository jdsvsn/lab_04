import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab_04/order.dart';
import 'package:lab_04/order_summary.dart';

void main() {
  test('orderTotal multiplies price by quantity', () {
    expect(orderTotal(12.50, 2), 25.00);
  });

  testWidgets('Order summary shows item, quantity and total', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OrderSummaryScreen(
          itemName: 'Cheese Pizza',
          price: 12.50,
          quantity: 2,
        ),
      ),
    );

    expect(find.text('Cheese Pizza'), findsOneWidget);
    expect(find.text('Quantity: 2'), findsOneWidget);
    expect(find.text('Total: RM 25.00'), findsOneWidget);
  });

  testWidgets('Back button returns to the previous screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const OrderSummaryScreen(
                    itemName: 'Cheese Pizza',
                    price: 12.50,
                    quantity: 2,
                  ),
                ),
              ),
              child: const Text('Open summary'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open summary'));
    await tester.pumpAndSettle();
    expect(find.text('Total: RM 25.00'), findsOneWidget);

    await tester.tap(find.text('Back'));
    await tester.pumpAndSettle();
    expect(find.text('Open summary'), findsOneWidget);
    expect(find.text('Total: RM 25.00'), findsNothing);
  });
}
