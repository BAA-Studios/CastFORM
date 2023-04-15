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
  print("Starting PDF Builder for fully filled Letter forms.");

  /*
  First grab the font and form template.
  This example uses the files local to the package for convenience.
  Please don't actually do this. This is for running this example file standalone only.

  The proper way to do it in Flutter:
  final ByteData fontAsBytes = await rootBundle.load("assets/fonts/RobotoSlab-Regular.ttf");
  final pw.Font font = pw.Font.ttf(fontAsBytes);
  final ByteData _templateBytes = await rootBundle.load("assets/form_templates/pokemon_decklist_a4.webp");
  final pw.Image formTemplate = pw.Image(pw.MemoryImage(_templateBytes.buffer.asUint8List()));
  */
  // prepare font
  final ByteData fontAsBytes = File("./lib/assets/RobotoSlab-Regular.ttf")
      .readAsBytesSync()
      .buffer
      .asByteData();
  final pw.Font font = pw.Font.ttf(fontAsBytes);
  // create text style with font
  final pw.TextStyle textStyle = pw.TextStyle(font: font, fontSize: 10.0);
  // prepare background template
  final Uint8List formTemplateAsBytes = File("./lib/assets/pokemon_decklist_letter.webp")
      .readAsBytesSync();
  final pw.Image formTemplate = pw.Image(pw.MemoryImage(formTemplateAsBytes));

  // Instantiate the form handler
  final pokemonDoc = LetterForm(
    formTemplate: formTemplate,
    textStyle: textStyle,
    name: "Ash Ketchum",
    playerId: "1234567890",
    dateOfBirth: "02/20/2002",
    deck: parseDeck(deckString),  // Extract information from the deck string
  );

  // Hydrate!
  final pdf = pokemonDoc.build();  // note: .buildPdf() will call .save for you

  final file = File("D:/GitHub/CastFORM/example.pdf");
  await file.writeAsBytes(await pdf.save());

  print("Done!");
}