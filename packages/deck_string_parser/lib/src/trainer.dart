import 'package:deck_string_parser/src/card.dart';

class Trainer extends Card {
  /// This represents Trainer-cards
  Trainer({
    required quantity,
    required name,
  }) : super(quantity: quantity, name: name);

  void setQuantity(String quantity) {
    super.quantity = quantity;
  }
}