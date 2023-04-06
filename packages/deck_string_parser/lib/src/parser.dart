import 'dart:convert';
import 'dart:core';

import 'package:deck_string_parser/src/energy.dart';
import 'package:deck_string_parser/src/pokemon.dart';
import 'package:deck_string_parser/src/trainer.dart';

const splitter = LineSplitter();

const Set<String> setAbbreviations = {
  "BS",
  "JU",
  "FO",
  "B2",
  "TR",
  "G1",
  "G2",
  "N1",
  "N2",
  "N3",
  "N4",
  "LC",
  "EX",
  "AQ",
  "SK",
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
  "DP",
  "MT",
  "SW",
  "GE",
  "MD",
  "LA",
  "SF",
  "PL",
  "RR",
  "SV",
  "AR",
  "HS",
  "UL",
  "UD",
  "TM",
  "CL",
  "BLW",
  "EPO",
  "NVI",
  "NXD",
  "DEX",
  "DRX",
  "BCR",
  "PLS",
  "PLF",
  "PLB",
  "LTR",
  "XY",
  "FLF",
  "FFI",
  "PHF",
  "PRC",
  "ROS",
  "AOR",
  "BKT",
  "BKP",
  "FCO",
  "STS",
  "EVO",
  "SUM",
  "GRI",
  "BUS",
  "CIN",
  "UPR",
  "FLI",
  "CES",
  "LOT",
  "TEU",
  "UNB",
  "UNM",
  "CEC",
  "SSH",
  "RCL",
  "DAA",
  "VIV",
  "BST",
  "CRE",
  "EVS",
  "FST",
  "BRS",
  "ASR",
  "LOR",
  "SIT",
  "SVI",
  "DRV",
  "KSS",
  "DCR",
  "GEN",
  "SLG",
  "DRM",
  "DET",
  "HIF",
  "CPA",
  "SHF",
  "CEL",
  "PGO",
  "CRZ",
  "BWP",
  "XYP",
  "SMP",
  "SVP",
  "P1",
  "P2",
  "P3",
  "P4",
  "P5",
  "P6",
  "P7",
  "P8",
  "P9",
  "SI",
  "CC",
  "RM",
  "MCD11",
  "MCD12",
  "MCD13",
  "MCD14",
  "MCD15",
  "MCD16",
  "MCD17",
  "MCD18",
  "MCD19",
  "FUT20",
  "MCD21",
  "MCD22",
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
  var lines = splitter.convert(deck);

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
  if (!isNumeric(firstWord)) {  // LimitlessTCG format; no headers
    return buffer;
  }

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
    if (!isNumeric(words.last)) {
      words.removeLast();  // strip holo card info (PTCGL format)
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

    // strip set information, if present
    var indexOfSetAbbreviation = words.length - 2;
    if (setAbbreviations.contains(words[indexOfSetAbbreviation])) {
      words.removeAt(indexOfSetAbbreviation);
    }

    buffer.add(Energy(
      quantity: words[0],
      name: words.sublist(1, words.length - 1).join(" "),
    ));
  }
  return buffer;
}