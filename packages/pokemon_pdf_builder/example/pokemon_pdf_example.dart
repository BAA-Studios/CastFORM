import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:deck_string_parser/deck_string_parser.dart';
import 'package:pokemon_pdf_builder/pokemon_pdf.dart';

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
  print("Starting PDF Builder for fully filled forms");

  /*
  First grab the font and form template.
  This example uses the files local to the package for convenience.
  Please don't actually do this. This is for running this example file standalone only.

  The proper way to do it in Flutter:
  final ByteData font = await rootBundle.load("assets/fonts/RobotoSlab-Regular.ttf");
  final ByteData _templateBytes = await rootBundle.load("assets/form_templates/pokemon_decklist_a4.webp");
  final Uint8List formTemplate = _templateBytes.buffer.asUint8List();
  */
  final ByteData font = File("./lib/assets/RobotoSlab-Regular.ttf")
      .readAsBytesSync()
      .buffer
      .asByteData();
  final Uint8List formTemplate = File("./lib/assets/pokemon_decklist_a4.webp")
      .readAsBytesSync();

  // Instantiate the form handler
  final pokemonDoc = getA4FormHandler(formTemplate, font);

  // Extract information from the deck string
  var deck = parseDeck(deckString);
  // Pass a full set of information to the handler
  pokemonDoc.deck = deck;
  pokemonDoc.name = "Brandon Nguyen";
  pokemonDoc.playerId = "1234567890";
  pokemonDoc.dateOfBirth = "04/14/2002";

  // Hydrate!
  final pdf = pokemonDoc.build();

  // final file = File("D:/GitHub/CastFORM/example_full.pdf");
  final file = File("C:/Users/Kooki/Desktop/dev/tcg_tools/CastFORM/example_full.pdf");
  await file.writeAsBytes(await pdf.save());

  print("Done!");

  // Let's try leaving fields empty, and see what happens this time
  // This is to make sure that behaviour is graceful even when there are missing fields
  print("Starting PDF Builder for unfilled forms");

  final emptyDoc = getA4FormHandler(formTemplate, font);

  // final file = File("D:/GitHub/CastFORM/example_empty.pdf");
  final emptyFile = File("C:/Users/Kooki/Desktop/dev/tcg_tools/CastFORM/example_empty.pdf");

  // Alternative to using `build` and then `save`,
  //  you may use the asynchronous `buildPdf` which does both.
  emptyDoc.buildPdf().then((value) => emptyFile.writeAsBytes(value));

  print("Done!");
}