import 'dart:io';
import 'dart:typed_data';
import 'package:pokemon_pdf_builder/pokemon_pdf.dart';

Future<void> main() async {
  final ByteData font = File("./lib/assets/RobotoSlab-Regular.ttf")
      .readAsBytesSync()
      .buffer
      .asByteData();
  final Uint8List formTemplate =
      File("./lib/assets/pokemon_decklist_a4.webp").readAsBytesSync();
  // Let's try leaving fields empty, and see what happens this time
  // This is to make sure that behaviour is graceful even when there are missing fields
  print("Starting PDF Builder for unfilled forms");

  final emptyDoc = getA4FormHandler(formTemplate, font);

// final file = File("D:/GitHub/CastFORM/example_empty.pdf");
  final emptyFile =
      File("C:/Users/Kooki/Desktop/dev/tcg_tools/CastFORM/example_empty.pdf");

// Alternative to using `build` and then `save`,
//  you may use the asynchronous `buildPdf` which does both.
  emptyDoc.buildPdf().then((value) => emptyFile.writeAsBytes(value));

  print("Done!");

/* To produce a live preview/render in Flutter
  import 'package:printing/printing.dart';

  ...  // Other higher level widgets in Flutter
  Widget build(BuildContext context) {
    return PdfPreview(
      build: emptyDoc.buildPdf(),
    );
  }
   */
}
