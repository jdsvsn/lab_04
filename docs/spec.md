# Order Summary Screen
Inputs: item name (String), unit price (double), quantity (int).
Output: a screen showing the item name, quantity and total price as "RM 0.00".
Rules: total comes from orderTotal(price, quantity) in lib/order.dart; quantity is 1 or more.
Out of scope: payment, editing quantity, saving orders, and changes to any other file.
Check: 2 x Cheese Pizza at RM 12.50 shows "Total: RM 25.00", and Back calls Navigator.pop.
