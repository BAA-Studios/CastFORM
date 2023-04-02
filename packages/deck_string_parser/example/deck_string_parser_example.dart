import 'package:deck_string_parser/deck_string_parser.dart';

void main() {
  // PTCGO-format deck string
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

  var deck = parseDeck(deckString);
  var pokemonList = deck.pokemonList;

  print("Pokemon --------------------------------------");

  for (var pokemon in pokemonList) {
    print("${pokemon.quantity} \t ${pokemon.name.padRight(25)} ${pokemon.set}");
  }

  print("Trainer --------------------------------------");

  for (var trainer in deck.trainerList) {
    print("${trainer.quantity} \t ${trainer.name}");
  }

  print("Energy --------------------------------------");

  for (var energy in deck.energyList) {
    print("${energy.quantity} \t ${energy.name}");
  }
}
