import 'package:deck_string_parser/src/card.dart';

class Energy extends Card{
  /// This represents Energy-cards
  ///
  /// `name` represents the name (and set, if applicable) of the card.
  Energy({
    required quantity,
    required name,
  }) : super(quantity: quantity, name: name);
}