/// Returns the total cost of an order: [price] multiplied by [quantity].
///
/// Throws an [ArgumentError] if [quantity] is less than 1.
double orderTotal(double price, int quantity) {
  if (quantity < 1) {
    throw ArgumentError.value(quantity, 'quantity', 'must be 1 or more');
  }
  return price * quantity;
}
