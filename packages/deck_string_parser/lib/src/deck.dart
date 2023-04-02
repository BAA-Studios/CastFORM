import 'package:deck_string_parser/src/energy.dart';
import 'package:deck_string_parser/src/pokemon.dart';
import 'package:deck_string_parser/src/trainer.dart';

class Deck {
  final List<Pokemon> pokemonList;
  final List<Trainer> trainerList;
  final List<Energy> energyList;

  /// This represents parsed-deck strings
  Deck({
    required this.pokemonList,
    required this.trainerList,
    required this.energyList,
  });
}