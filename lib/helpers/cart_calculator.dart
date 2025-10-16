class CartItem {
  final String id;
  final String name;
  final double price;
  int quantity;
  final double discount; // Discount percentage (0.0 to 1.0)

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
    this.discount = 0.0,
  });
}

class CartCalculator {
  static void addItem(
    List<CartItem> items,
    String id,
    String name,
    double price, {
    double discount = 0.0,
  }) {
    final existingIndex = items.indexWhere((item) => item.id == id);

    if (existingIndex >= 0) {
      items[existingIndex].quantity++;
    } else {
      items.add(
        CartItem(id: id, name: name, price: price, discount: discount),
      );
    }
  }

  static void removeItem(List<CartItem> items, String id) {
    items.removeWhere((item) => item.id == id);
  }

  static void updateQuantity(List<CartItem> items, String id, int newQuantity) {
    final index = items.indexWhere((item) => item.id == id);
    if (index != -1) {
      if (newQuantity <= 0) {
        items.removeAt(index);
      } else {
        items[index].quantity = newQuantity;
      }
    }
  }

  static void clearCart(List<CartItem> items) {
    items.clear();
  }

  static double calculateSubtotal(List<CartItem> items) {
    double total = 0;
    for (var item in items) {
      total += item.price * item.quantity;
    }
    return total;
  }

  static double calculateTotalDiscount(List<CartItem> items) {
    double discount = 0;
    for (var item in items) {
      discount += (item.discount * item.price) * item.quantity;
    }
    return discount;
  }

  static double calculateTotalAmount(List<CartItem> items) {
    return calculateSubtotal(items) - calculateTotalDiscount(items);
  }

  static int calculateTotalItems(List<CartItem> items) {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }
}
