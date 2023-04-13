import 'package:deck_string_parser/deck_string_parser.dart';
import 'package:pokemon_pdf_builder/pokemon_pdf.dart';
import 'dart:io';


final deckString = """Pok?mon: 9
4 Lechonk SVI 156
3 Oinkologne ex SVI 158
1 Dunsparce FST 207
4 Kirlia SIT 68
1 Radiant Gardevoir LOR 69
1 Gallade ASR 62 PH
1 Gallade ASR 62
4 Ralts ASR 60
1 Manaphy BRS 41

Trainer: 15
2 Pal Pad SSH 172
1 Escape Rope BST 125
4 Level Ball AOR 76
1 Serena SIT 193
4 Nest Ball SVI 181
4 Capturing Aroma SIT 153
4 Battle VIP Pass FST 225
4 Path to the Peak CRE 148
1 Full Face Guard EVS 148
1 Boss's Orders RCL 154
1 Roxanne ASR 150
2 Cheren's Care BRS 134
3 Professor's Research CEL 24
3 Judge FST 235
1 Switch SVI 194

Energy: 1
4 V Guard Energy SIT 169

Total Cards: 60
""";

Future<void> main() async {
  print("Starting PDF Builder");

  var deck = parseDeck(deckString);
  final pokemonDoc = PokemonPdf(deck: deck);

  pokemonDoc.name = "Brandon Nguyen";
  pokemonDoc.playerId = "1234567890";
  pokemonDoc.dateOfBirth = "04/14/2002";

  final pdf = pokemonDoc.build();

  final file = File("D:/GitHub/CastFORM/example.pdf");
  await file.writeAsBytes(await pdf.save());

  print("Done!");
}