import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:pokemon_pdf_builder/pokemon_pdf.dart';

Future<void> main() async {
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
  final Uint8List formTemplateAsBytes = File("./lib/assets/pokemon_decklist_a4.webp")
      .readAsBytesSync();
  final pw.Image formTemplate = pw.Image(pw.MemoryImage(formTemplateAsBytes));

  // Let's try leaving fields empty, and see what happens this time
  // This is to make sure that behaviour is graceful even when there are missing fields
  print("Starting PDF Builder for unfilled forms");

  final emptyDoc = A4Form(
    formTemplate: formTemplate,
    textStyle: textStyle,
  );

  // final file = File("D:/GitHub/CastFORM/example_empty.pdf");
  final emptyFile =
      File("C:/Users/Kooki/Desktop/dev/tcg_tools/CastFORM/example_empty.pdf");

  // Alternative to using `build` and then `save`,
  //  you may use the asynchronous `buildPdf` which does both.
  emptyDoc.buildPdf().then((value) => emptyFile.writeAsBytes(value));

  print("Done!");

  /*
  To produce a live preview/render in Flutter
  import 'package:printing/printing.dart';

  ...  // Other higher level widgets in Flutter
  Widget build(BuildContext context) {
    return PdfPreview(
      build: emptyDoc.buildPdf(),
    );
  }
  */
}
