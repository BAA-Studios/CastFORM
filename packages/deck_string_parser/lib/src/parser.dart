import 'dart:convert';
import 'dart:core';

import 'package:deck_string_parser/src/energy.dart';
import 'package:deck_string_parser/src/pokemon.dart';
import 'package:deck_string_parser/src/trainer.dart';

const splitter = LineSplitter();

const Set<String> setAbbreviations = {  // accessed on 9th JUL 2023: https://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_Trading_Card_Game_expansions
  // Wizards of the Coast Expansions -------------------------------------------
  "BS",
  "JU",
  "FO",
  "B2",
  "TR",
  "G1",
  "G2",
  // Neo Series
  "N1",
  "N2",
  "N3",
  "N4",
  // Legendary Collection Series
  "LC",
  // e-Card Series
  "EX",
  "AQ",
  "SK",
  // Nintendo Expansions -------------------------------------------------------
  // EX Series
  "RS",
  "SS",
  "DR",
  "MA",
  "HL",
  "FL",
  "TRR",
  "DX",
  "EM",
  "UF",
  "DS",
  "LM",
  "HP",
  "CG",
  "DF",
  "PK",
  // Diamond & Pearl Series
  "DP",
  "MT",
  "SW",
  "GE",
  "MD",
  "LA",
  "SF",
  // Platinum Series
  "PL",
  "RR",
  "SV",
  "AR",
  // HeartGold & SoulSilver Series
  "HS",
  "UL",
  "UD",
  "TM",
  // Call of Legends Series/Pokémon Trading Card Game Classic (Shares the same code)
  "CL",
  // Black & White Series
  "BLW",
  "EPO",
  "NVI",
  "NXD",
  "DEX",
  "DRX",
  "DRV",
  "BCR",
  "PLS",
  "PLF",
  "PLB",
  "LTR",
  // XY Series
  "KSS",
  "XY",
  "FLF",
  "FFI",
  "PHF",
  "PRC",
  "DCR",
  "ROS",
  "AOR",
  "BKT",
  "BKP",
  "GEN",
  "FCO",
  "STS",
  "EVO",
  // Sun & Moon Series
  "SUM",
  "GRI",
  "BUS",
  "SLG",
  "CIN",
  "UPR",
  "FLI",
  "CES",
  "DRM",
  "LOT",
  "TEU",
  "DET",
  "UNB",
  "UNM",
  "HIF",
  "CEC",
  // Sword & Shield Series
  "SSH",
  "RCL",
  "DAA",
  "CPA",
  "VIV",
  "SHF",
  "BST",
  "CRE",
  "EVS",
  "CEL",
  "FST",
  "BRS",
  "ASR",
  "PGO",
  "LOR",
  "SIT",
  "CRZ",
  // Scarlet & Violet Series
  "SVI",
  "PAL",
  "OBF",
  "MEW",
  // Other Sets ----------------------------------------------------------------
  // Basic Energy Cards
  "SVE",
  // Black Star Promotional Cards
  "WP",
  "NP",
  "DPP",
  "HSP",
  "BWP",
  "XYP",
  "SMP",
  "SSP",
  "SVP",
  // McDonald's Collection
  "MCD11",
  "MCD12",
  "MCD13",
  "MCD14",
  "MCD15",
  "MCD16",
  "MCD17",
  "MCD18",
  "MCD19",
  "MCD21",
  "MCD22",
  // POP / Play! Pokemon Prize Packs
  "POP1",
  "POP2",
  "POP3",
  "POP4",
  "POP5",
  "POP6",
  "POP7",
  "POP8",
  "POP9",
  "PPS1",
  "PPS2",
  // Other Miscellaneous Sets
  "SI",
  "CC",
  "RM",
  "FUT20",
};

/// Checks if a given string is numeric
///
/// Used for checking `PH` and other odd trailing characters
bool isNumeric(String s) {
  return double.tryParse(s) != null;
}

/// Splits a provided deck string based on their sections
///
/// Each element is a section, rather than a particular line
List<List<String>> crudeSplit(String deck) {
  var trimmedDeck = deck.trim();
  var lines = splitter.convert(trimmedDeck);

  // Find where the paragraph breaks are
  List<int> breaks = [];
  for (var i = 0; i < lines.length; i++) {
    if (lines[i].isEmpty) {
      breaks.add(i);
    }
  }

  // Sanity check
  if (breaks.length < 2 || breaks.length > 3) {
    throw FormatException("Expected either 3 or 4 paragraphs. Received ${breaks.length + 1}.");
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

/// Strips off section labels, if they exist
List<List<String>> stripHeaders(List<List<String>> crudeDeckList) {
  List<List<String>> buffer = [];

  // Check if headers exist
  var firstWord = crudeDeckList[0][0].split(" ")[0];
  if (isNumeric(firstWord)) {  // LimitlessTCG format; no headers
    return crudeDeckList;
  }

  for (var section in crudeDeckList) {
    buffer.add(section.sublist(1));
  }
  return buffer;
}

/// Checks if a particular card name already exists
///
/// Pokemon with the same name and set, but from different sets can be merged into
/// the same line, since the set name doesn't need to be filled out.
/// If a pokemon of the same name and set is found, the index is returned.
/// `-1` is returned if there are no matches.
int findExistingPokemon(String name, String set, List<Pokemon> buffer) {
  if (buffer.isEmpty) {
    return -1;
  }
  for (var i = 0; i < buffer.length; i++) {
    if (buffer[i].name == name && buffer[i].set == set) {
      return i;
    }
  }
  return -1;
}

int findExistingEnergy(String name, List<Energy> buffer) {
  if (buffer.isEmpty) {
    return -1;
  }
  for (var i = 0; i < buffer.length; i++) {
    if (buffer[i].name == name) {
      return i;
    }
  }
  return -1;
}

/// Extract pokemon cards
List<Pokemon> parsePokemonCards(List<List<String>> crudeDeckList) {
  List<Pokemon> buffer = [];
  var section = crudeDeckList[0];
  for (var line in section) {
    var words = line.split(" ");
    if (!isNumeric(words.last)) {
      words.removeLast();  // strip holo card info (PTCGL format)
    }
    var indexOfSetAbbreviation = words.length - 2;
    var name = words.sublist(1, indexOfSetAbbreviation).join(" ");
    var existingPokemonIndex = findExistingPokemon(name, words[indexOfSetAbbreviation], buffer);

    if (existingPokemonIndex == -1) {
      buffer.add(Pokemon(
        quantity: words[0],
        name: words.sublist(1, indexOfSetAbbreviation).join(" "),
        set: words[indexOfSetAbbreviation],
      ));
    } else {
      var existingQuantity = buffer[existingPokemonIndex].quantity;
      buffer[existingPokemonIndex].quantity = addQuantities(existingQuantity, words[0]);
    }
  }
  return buffer;
}

/// Checks if a particular card name already exists
///
/// Trainers with the same name, but from different sets can be merged into
/// the same line, since the set name doesn't need to be filled out.
/// If a trainer of the same name is found, the index is returned.
/// `-1` is returned if there are no matches.
int findExistingTrainer(String name, List<Trainer> buffer) {
  if (buffer.isEmpty) {
    return -1;
  }
  for (var i = 0; i < buffer.length; i++) {
    if (buffer[i].name == name) {
      return i;
    }
  }
  return -1;
}

/// Adds 2 int-like strings, and returns the result as a string
String addQuantities(String firstOperand, String secondOperand) {
  int? i = int.tryParse(firstOperand);
  int? j = int.tryParse(secondOperand);

  if (i == null || j == null) {
    throw FormatException("Expected 2 int-like operands.");
  }

  return (i + j).toString();
}

/// Extract trainer cards
List<Trainer> parseTrainerCards(List<List<String>> crudeDeckList) {
  List<Trainer> buffer = [];
  var section = crudeDeckList[1];
  for (var line in section) {
    var words = line.split(" ");
    // PTCGL full arts/alt arts seem to have "PH"
    // appended to trainers unlike pokemon
    if (words.last == "PH") {
      words.removeLast();
    }
    var indexOfSetAbbreviation = words.length - 2;
    var name = words.sublist(1, indexOfSetAbbreviation).join(" ");
    var existingTrainerIndex = findExistingTrainer(name, buffer);

    if (existingTrainerIndex == -1) {
      buffer.add(Trainer(  // No cards with the same name
        quantity: words[0],
        name: name,
      ));
    } else {  // Merge with existing entry
      var existingQuantity = buffer[existingTrainerIndex].quantity;
      buffer[existingTrainerIndex].setQuantity(
          addQuantities(existingQuantity, words[0])
      );
    }
  }
  return buffer;
}

/// Extract energy cards
List<Energy> parseEnergyCards(List<List<String>> crudeDeckList) {
  List<Energy> buffer = [];
  var section = crudeDeckList[2];
  for (var line in section) {
    var words = line.split(" ");

    // strip set information, if present
    var indexOfSetAbbreviation = words.length - 2;
    if (setAbbreviations.contains(words[indexOfSetAbbreviation])) {
      words.removeAt(indexOfSetAbbreviation);
    }

    var name = words.sublist(1, words.length - 1).join(" ");
    name = ptcglEnergyFormatToEnglish(name);

    var existingEnergyIndex = findExistingEnergy(name, buffer);

    if (existingEnergyIndex == -1) {
      buffer.add(Energy(  // No cards with the same name
        quantity: words[0],
        name: name,
      ));
    } else {  // Merge with existing entry
      var existingQuantity = buffer[existingEnergyIndex].quantity;
      buffer[existingEnergyIndex].setQuantity(
          addQuantities(existingQuantity, words[0])
      );
    }
  }
  return buffer;
}

/// PTCGL Deck list formats typically show energy names as:
/// {W} Energy Energy, {P} Energy Energy, etc..
///
/// This converts any energy Name:
/// "{W} Energy Energy" -> "Water Energy" and so on.
String ptcglEnergyFormatToEnglish(String energyName) {
  final Map<String, String> energySymbols = {
    "{D}" : "Dark",
    "{F}" : "Fighting",
    "{G}" : "Grass",
    "{L}" : "Lightning",
    "{M}" : "Metal",
    "{W}" : "Water",
    "{R}" : "Fire",
    "{P}" : "Psychic",
  };
  energySymbols.forEach((key, value) {
    energyName = energyName.replaceFirst(key, value);
  });
  energyName = energyName.replaceFirst("Energy Energy", "Energy");
  // Remove anything after Energy word
  var endToken = "Energy";
  var indexToEnd = energyName.indexOf(endToken)+endToken.length;
  var cleanEnergyName = energyName.substring(0, indexToEnd);
  return cleanEnergyName;
}