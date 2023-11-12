import 'package:deck_string_parser/deck_string_parser.dart';
import 'package:test/test.dart';

void main() {
  var testDeckString = """Pok?mon (19)
4 Mareep EVS 54
3 Flaaffy EVS 55
2 Zekrom VIV 60
1 Zapdos PGO 29
1 Vikavolt V DAA 60
1 Raichu V BRS 45
1 Zeraora V CRE 53
1 Medicham V EVS 83
1 Drapion V LOR 118
1 Radiant Greninja ASR 46
1 Manaphy BRS 41
1 Pyukumuku FST 77
1 Snorlax VIV 131

Trainer (30)
4 Professor's Research SVI 189
3 Boss's Orders BRS 132
1 Serena SIT 164
4 Quick Ball FST 237
4 Level Ball BST 129
4 Scoop Up Net RCL 165
2 Ordinary Rod SSH 171
1 Hisuian Heavy Ball ASR 146
1 Escape Rope BST 125
2 Air Balloon SSH 156
1 Forest Seal Stone SIT 156
3 Stormy Mountains EVS 161

Energy (11)
7 Lightning Energy 4
4 Speed Lightning Energy RCL 173""";

  var limitlessTcgDeckString = """4 Ralts ASR 60
4 Kirlia SIT 68
2 Gardevoir ex SVI 86
1 Gardevoir CRE 61
1 Mewtwo V-UNION PR-SW 159
1 Mewtwo V-UNION PR-SW 162
1 Mewtwo V-UNION PR-SW 160
1 Mewtwo V-UNION PR-SW 161
1 Zacian V CEL 16
1 Manaphy BRS 41
1 Mew CEL 11
1 Radiant Greninja ASR 46
1 Klefki SVI 96

3 Professor's Research SVI 189
1 Judge SVI 176
1 Miriam SVI 179
1 Peonia CRE 149
1 Klara CRE 145
1 Serena SIT 164
1 Roxanne ASR 150
1 Boss's Orders BRS 132
4 Level Ball BST 129
4 Battle VIP Pass FST 225
3 Ultra Ball SVI 196
3 Fog Crystal CRE 140
1 Rescue Carrier CRZ 142
1 Pal Pad SVI 182
1 Sky Seal Stone CRZ 143
2 Temple of Sinnoh ASR 155

11 Psychic Energy 5""";

  var ptcglDeckString = """Pok?mon: 9
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

  var ptcgoDeck = parseDeck(testDeckString);
  var ptcglDeck = parseDeck(ptcglDeckString);
  var limitlessDeck = parseDeck(limitlessTcgDeckString);

  group('Validation checks', () {
    test('`isValidDeckCount`: check if 60 cards in deck in ptcgoDeck', () {
      expect(isValidDeckCount(ptcgoDeck), true);
    });

    test('`isValidDeckCount`: check if 60 cards in deck in ptcglDeck', () {
      expect(isValidDeckCount(ptcglDeck), true);
    });

    test('`isValidDeckCount`: check if 60 cards in deck in limitlessDeck', () {
      expect(isValidDeckCount(limitlessDeck), true);
    });
  });
}
