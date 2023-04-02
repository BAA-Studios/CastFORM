import 'package:test/test.dart';

import 'package:deck_string_parser/src/deck.dart';
import 'package:deck_string_parser/src/energy.dart';
import 'package:deck_string_parser/src/parser.dart';
import 'package:deck_string_parser/src/pokemon.dart';
import 'package:deck_string_parser/src/trainer.dart';

void main() {
  group('Initial string processing', () {
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

    test('`crudeSplit` correctly splits a PTCGO deck string into a list of 3 elements', () {
      expect(crudeSplit(PTCGODeckString).length, 3);
    });

    test('`crudeSplit` correctly splits a PTCGL deck string into a list of 4 elements', () {
      expect(crudeSplit(PTCGLDeckString).length, 4);
    });

    test('`handlePTCGLFormat` returns a list of 3 elements for PTCGO decks', () {
      expect(handlePTCGLFormat(crudeSplit(PTCGODeckString)).length, 3);
    });

    test('`handlePTCGLFormat` returns a list of 3 elements for PTCGL decks', () {
      expect(handlePTCGLFormat(crudeSplit(PTCGLDeckString)).length, 3);
    });

    test('`strip` removes the header properly', () {
      var splitSection = [
        "Pokémon: 9",
        "4 Lechonk SVI 156",
        "3 Oinkologne ex SVI 158",
        "4 Ralts ASR 60",
        "4 Kirlia SIT 68",
        "2 Gallade ASR 62 PH",
        "1 Radiant Gardevoir LOR 69",
        "1 Manaphy BRS 41",
        "1 Dunsparce FST 207",
      ];
      
      expect(strip(splitSection).length, splitSection.length - 1);
    });

    test('`fineSplit` splits and formats a given section', () {
      var section = """Pokémon: 9
4 Lechonk SVI 156
3 Oinkologne ex SVI 158
4 Ralts ASR 60
4 Kirlia SIT 68
2 Gallade ASR 62 PH
1 Radiant Gardevoir LOR 69
1 Manaphy BRS 41
1 Dunsparce FST 207""";

      expect(fineSplit(section), 8);
    });
  });

  group('Data extraction', () {

    test('`parsePokemonCards` extracts the correct number of cards from the crude deck list', () {
      // expect(fooBar, isTrue);
    });

    test('`parseTrainerCards` extracts the correct number of cards from the crude deck list', () {
      // expect(fooBar, isTrue);
    });

    test('`parseEnergyCards` extracts the correct number of cards from the crude deck list', () {
      // expect(fooBar, isTrue);
    });

    test('`parsePokemonCards` extracts the first card correctly as a Pokemon object', () {
      // expect(fooBar, isTrue);
    });

    test('`parseTrainerCards` extracts the first card correctly as a Trainer object', () {
      // expect(fooBar, isTrue);
    });

    test('`parseEnergyCards` extracts the first card correctly as a Energy object', () {
      // expect(fooBar, isTrue);
    });
  });
}
