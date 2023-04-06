class Trainer {
  String quantity;
  final String name;

  /// This represents Trainer-cards
  Trainer({
    required this.quantity,
    required this.name,
  });

  void setQuantity(String quantity) {
    this.quantity = quantity;
  }
}