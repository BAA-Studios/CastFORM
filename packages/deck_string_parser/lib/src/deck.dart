import 'package:deck_string_parser/src/energy.dart';
import 'package:deck_string_parser/src/pokemon.dart';
import 'package:deck_string_parser/src/trainer.dart';

class Deck {
  final Pokemon pokemon;
  final Trainer trainer;
  final Energy energy;

  /// This represents parsed-deck strings
  Deck({
    required this.pokemon,
    required this.trainer,
    required this.energy,
  });
}