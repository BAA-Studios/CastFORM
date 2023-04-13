class Card {
  String quantity;
  final String name;
  String set;

  /// This represents card attributes
  Card({
    required this.quantity,
    required this.name,
    this.set = "",
  });
}