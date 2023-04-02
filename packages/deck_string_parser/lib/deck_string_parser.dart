/// Utility functions for parsing of PTCGO/PTCGL decks
library deck_string_parser;

import 'package:deck_string_parser/src/deck.dart';
import 'package:deck_string_parser/src/parser.dart';

export 'src/energy.dart';
export 'src/pokemon.dart';
export 'src/trainer.dart';
export 'src/deck.dart';

Deck parseDeck(String deckString) {
  var crudeDeckList = stripHeaders(crudeSplit(deckString));
  return Deck(
      pokemonList: parsePokemonCards(crudeDeckList),
      trainerList: parseTrainerCards(crudeDeckList),
      energyList: parseEnergyCards(crudeDeckList),
  );
}

// TODO: Validation functions