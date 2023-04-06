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

  var testDeck = parseDeck(testDeckString);

  group('Validation checks', () {

    test('Some kind of illegal deck caught correctly', () {
      expect(isValidDeckCount(testDeck), true);
    });
  });
}
