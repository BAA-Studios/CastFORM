import 'dart:convert';
import 'dart:core';

import 'package:deck_string_parser/src/energy.dart';
import 'package:deck_string_parser/src/pokemon.dart';
import 'package:deck_string_parser/src/trainer.dart';

const splitter = LineSplitter();

/*
// For debug use
void main() {
  // Sample PTCGO format
  var deckString = """Pokémon (13)
4 Mew V CRZ 60
3 Mew VMAX FST 114
4 Genesect V FST 185
1 Aerodactyl V LOR 92
1 Aerodactyl VSTAR LOR 93

Trainer (43)
3 Judge FST 235
2 Boss's Orders BRS 132
1 Roxanne ASR 150
1 Cyllene ASR 138
4 Power Tablet FST 236
4 Battle VIP Pass FST 225
4 Quick Ball FST 237
4 Ultra Ball CRZ 146
3 Cram-o-matic FST 229
3 Rotom Phone CPA 64
2 Lost Vacuum CRZ 135
2 Escape Rope BST 125
1 Switch CRZ 144
1 Pal Pad SSH 172
1 Hisuian Heavy Ball ASR 146
1 Forest Seal Stone SIT 156
1 Choice Belt BRS 135
1 Big Charm SSH 158
2 Path to the Peak CRE 148
2 Lost City LOR 161

Energy (4)
4 Double Turbo Energy BRS 151""";

  // Debug code
}
*/

/// Checks if a given string is numeric
///
/// Used for checking `PH` Pokemon cards
bool isNumeric(String s) {
  return double.tryParse(s) != null;
}

/// Splits a provided deck string based on their sections
///
/// Each element is a section, rather than a particular line
List<List<String>> crudeSplit(String deck) {
  var lines = splitter.convert(deck);

  // Find where the paragraph breaks are
  List<int> breaks = [];
  for (var i = 0; i < lines.length; i++) {
    if (lines[i].isEmpty) {
      breaks.add(i);
    }
  }

  // Split into a list of list, based on section
  List<List<String>> buffer = [];
  buffer.add(lines.sublist(0, breaks[0]));  // Pokemon section
  // +1 to index to skip the empty line:
  buffer.add(lines.sublist(breaks[0] + 1, breaks[1]));  // Trainer section
  // Energy section:
  if (breaks.length < 3) {
    buffer.add(lines.sublist(breaks[1] + 1));
  } else {  // Strip off Total Cards section
    buffer.add(lines.sublist(breaks[1] + 1, breaks[2]));
  }

  return buffer;
}

/// Strips off section labels
List<List<String>> stripHeaders(List<List<String>> crudeDeckList) {
  List<List<String>> buffer = [];
  for (var section in crudeDeckList) {
    buffer.add(section.sublist(1));
  }
  return buffer;
}

/// Extract pokemon cards
List<Pokemon> parsePokemonCards(List<List<String>> crudeDeckList) {
  List<Pokemon> buffer = [];
  var section = crudeDeckList[0];
  for (var line in section) {
    var words = line.split(" ");
    if (words.last == "PH") {  // strip holo card info (PTCGL format)
      words.removeLast();
    }
    var indexOfSetAbbreviation = words.length - 2;
    buffer.add(Pokemon(
        quantity: words[0],
        name: words.sublist(1, indexOfSetAbbreviation).join(" "),
        set: words[indexOfSetAbbreviation],
    ));
  }
  return buffer;
}

/// Extract trainer cards
List<Trainer> parseTrainerCards(List<List<String>> crudeDeckList) {
  List<Trainer> buffer = [];
  var section = crudeDeckList[1];
  for (var line in section) {
    var words = line.split(" ");
    var indexOfSetAbbreviation = words.length - 2;
    buffer.add(Trainer(
        quantity: words[0],
        name: words.sublist(1, indexOfSetAbbreviation).join(" "),
    ));
  }
  return buffer;
}

/// Extract energy cards
List<Energy> parseEnergyCards(List<List<String>> crudeDeckList) {
  List<Energy> buffer = [];
  var section = crudeDeckList[2];
  for (var line in section) {
    var words = line.split(" ");
  }
  return buffer;
}