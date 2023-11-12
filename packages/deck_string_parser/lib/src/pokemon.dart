import 'package:deck_string_parser/src/card.dart';

class Pokemon extends Card {
  /// This represents Pokemon-cards
  Pokemon({
    required quantity,
    required name,
    required set,
  }) : super(quantity: quantity, name: name, set: set);
}
