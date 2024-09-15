import 'package:deck_string_parser/src/card.dart';

class Energy extends Card {
  /// This represents Energy-cards
  ///
  /// `name` represents the name (and set, if applicable) of the card.
  Energy({
    required super.quantity,
    required super.name,
  });
}
