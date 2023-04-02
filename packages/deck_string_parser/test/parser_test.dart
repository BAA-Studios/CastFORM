import 'package:test/test.dart';

import 'package:deck_string_parser/src/energy.dart';
import 'package:deck_string_parser/src/parser.dart';
import 'package:deck_string_parser/src/pokemon.dart';
import 'package:deck_string_parser/src/trainer.dart';

void main() {
  group('Initial string pre-processing', () {
    // Deck strings
    var PTCGODeckString = """Pokémon (13)
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
    var PTCGLDeckString = """Pokémon: 9
4 Lechonk SVI 156
3 Oinkologne ex SVI 158
4 Ralts ASR 60
4 Kirlia SIT 68
2 Gallade ASR 62 PH
1 Radiant Gardevoir LOR 69
1 Manaphy BRS 41
1 Dunsparce FST 207

Trainer: 16
3 Judge FST 235
2 Cheren's Care BRS 134
1 Boss's Orders RCL 154
1 Serena SIT 193
1 Roxanne ASR 150
4 Level Ball AOR 76
4 Nest Ball SVI 181
4 Capturing Aroma SIT 153
4 Battle VIP Pass FST 225
2 Pal Pad SVI 182
1 Escape Rope BST 125
1 Switch SVI 194
1 Full Face Guard EVS 148
4 Path to the Peak CRE 148
3 Professor's Research CEL 24

Energy: 1
4 V Guard Energy SIT 169

Total Cards: 60""";

    test('`crudeSplit` correctly splits a PTCGO deck string into 3 sections', () {
      expect(crudeSplit(PTCGODeckString).length, 3);
    });

    test('`crudeSplit` correctly splits a PTCGL deck string into 3 sections', () {
      expect(crudeSplit(PTCGLDeckString).length, 3);
    });

    test('`crudeSplit` extracts the correct number of lines for pokemon', () {
      expect(crudeSplit(PTCGODeckString)[0].length, 6);
    });

    test('`crudeSplit` extracts the correct number of lines for trainer', () {
      expect(crudeSplit(PTCGODeckString)[1].length, 21);
    });

    test('`crudeSplit` extracts the correct number of lines for energy', () {
      expect(crudeSplit(PTCGODeckString)[2].length, 2);
    });

    test('`stripHeaders` does not change number of sections', () {
      expect(stripHeaders(crudeSplit(PTCGODeckString)).length, 3);
    });

    test('`stripHeaders` produces the correct number of lines for pokemon', () {
      expect(stripHeaders(crudeSplit(PTCGODeckString))[0].length, 5);
    });
  });

  group('Data extraction', () {
    var deck = [
      [
        "4 Lechonk SVI 156",
        "3 Oinkologne ex SVI 158",
        "4 Ralts ASR 60",
        "4 Kirlia SIT 68",
        "2 Gallade ASR 62 PH",
        "1 Radiant Gardevoir LOR 69",
        "1 Manaphy BRS 41",
        "1 Dunsparce FST 207",
      ],
      [
        "3 Judge FST 235",
        "2 Cheren's Care BRS 134",
        "1 Boss's Orders RCL 154",
        "1 Serena SIT 193",
        "1 Roxanne ASR 150",
        "4 Level Ball AOR 76",
        "4 Nest Ball SVI 181",
        "4 Capturing Aroma SIT 153",
        "4 Battle VIP Pass FST 225",
        "2 Pal Pad SVI 182",
        "1 Escape Rope BST 125",
        "1 Switch SVI 194",
        "1 Full Face Guard EVS 148",
        "4 Path to the Peak CRE 148",
        "3 Professor's Research CEL 24",
      ],
      [
        "4 V Guard Energy SIT 169",
      ],
    ];

    test('`parsePokemonCards` extracts the correct number of lines from the crude deck list', () {
      expect(parsePokemonCards(deck).length, 8);
    });

    test('`parseTrainerCards` extracts the correct number of lines from the crude deck list', () {
      expect(parseTrainerCards(deck).length, 15);
    });

    test('`parseEnergyCards` extracts the correct number of lines from the crude deck list', () {
      expect(parseEnergyCards(deck).length, 1);
    });

    test('`parsePokemonCards` extracts the first card correctly as a Pokemon object', () {
      expect(parsePokemonCards(deck)[0].quantity, "4");
      expect(parsePokemonCards(deck)[0].name, "Lechonk");
      expect(parsePokemonCards(deck)[0].set, "SVI");
    });

    test('`parsePokemonCards` extracts the holo pokemon cards correctly', () {
      expect(parsePokemonCards(deck)[4].quantity, "2");
      expect(parsePokemonCards(deck)[4].name, "Gallade");
      expect(parsePokemonCards(deck)[4].set, "ASR");
    });

    test('`parseTrainerCards` extracts the first card correctly as a Trainer object', () {
      expect(parseTrainerCards(deck)[0].quantity, "2");
      expect(parseTrainerCards(deck)[0].name, "Judge");
    });

    test('`parseEnergyCards` extracts the first card correctly as a Energy object', () {
      expect(parseEnergyCards(deck)[0].quantity, "4");
      expect(parseEnergyCards(deck)[0].name, "V Guard Energy");
    });
  });
}
