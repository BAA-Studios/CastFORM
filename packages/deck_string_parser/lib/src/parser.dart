import 'dart:core';

import 'package:deck_string_parser/src/energy.dart';
import 'package:deck_string_parser/src/pokemon.dart';
import 'package:deck_string_parser/src/trainer.dart';

/// Splits a provided deck string based on their sections
///
/// Each element is a section, rather than a particular line
List<String> crudeSplit(String deck) {

}

/// Strips off Total Cards section, if applicable
List<String> handlePTCGLFormat(List<String> deck) {

}

/// Strips off section labels (used by fineSplit)
List<String> strip(List<String> section) {

}

/// Splits a section into individual lines, and removes the header
/// (Used by the parse functions below)
List<String> fineSplit(String section) {

}

/// Extract pokemon cards
List<Pokemon> parsePokemonCards(List<String> deck {

}

/// Extract trainer cards
List<Trainer> parseTrainerCards(List<String> deck {

}

/// Extract energy cards
List<Energy> parseEnergyCards(List<String> deck {

}