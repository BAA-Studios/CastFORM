import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:deck_string_parser/deck_string_parser.dart';
import 'package:pokemon_pdf_builder/src/abstract_form.dart';
import 'package:pokemon_pdf_builder/src/utility.dart';

class GenericForm implements AbstractForm {
  Deck? deck;

  String name = "";
  String playerId = "";
  String dateOfBirth = "";

  late pw.MemoryImage pokemonFormImage;

  late pw.Font font;
  static const double fontSize = 10;
  late pw.TextStyle textStyle = pw.TextStyle(font: font, fontSize: fontSize);

  late PdfPageFormat pageFormat;
  // Page size-related coordinates -------------------------------------------------
  late double docX;
  late double docY;

  // This offset tells us where the Pokemon Row on the PDF Starts on the Y-Plane
  late double pokemonRowY;
  late double trainerRowY;
  late double energyRowY;

  late double pokemonSetRowX;

  // Name offset
  late double nameX;
  late double nameY;

  // PlayerId offsets
  late double playerIdX;
  late double playerIdY;

  // DoB offsets
  late double dobX; // Indicates the X of the month
  late double dobY;
  late double dobDayXOffset; // This is dobX + thisOffset
  late double dobYearXOffset; // dobX + dobDayXOffset + thisOffset

  // Deck related fields
  late double nameFieldX;
  late double quantityFieldX;

  // ---------------------------------------------------------------------------
  void setFormTemplate(Uint8List formTemplate) {
    pokemonFormImage = pw.MemoryImage(formTemplate);
  }

  void setFont(ByteData fontData) {
    font = pw.Font.ttf(fontData);
  }

  void setDeck(Deck deck) {
    this.deck = deck;
  }

  GenericForm({
    required Uint8List formTemplate,
    required ByteData font,
  }) {
    setFormTemplate(formTemplate);
    setFont(font);
  }

  @override
  List<pw.Widget> generatePokemonColumn() {
    var list = deck?.pokemonList ?? [];
    return populateWithStrings(extractName(list), docX, pokemonRowY, textStyle);
  }

  @override
  List<pw.Widget> generatePokemonQuantity() {
    var list = deck?.pokemonList ?? [];
    return populateWithStrings(extractQuantity(list), docX, pokemonRowY, textStyle);
  }

  @override
  List<pw.Widget> generatePokemonSet() {
    var list = deck?.pokemonList ?? [];
    return populateWithStrings(extractSet(list), docX, pokemonRowY, textStyle);
  }

  @override
  List<pw.Widget> generateTrainersColumn() {
    var list = deck?.trainerList ?? [];
    return populateWithStrings(extractName(list), docX, trainerRowY, textStyle);
  }

  @override
  List<pw.Widget> generateTrainerQuantity() {
    var list = deck?.trainerList ?? [];
    return populateWithStrings(extractQuantity(list), docX, trainerRowY, textStyle);
  }

  @override
  List<pw.Widget> generateEnergiesColumn() {
    var list = deck?.energyList ?? [];
    return populateWithStrings(extractName(list), docX, energyRowY, textStyle);
  }

  @override
  List<pw.Widget> generateEnergyQuantity() {
    var list = deck?.energyList ?? [];
    return populateWithStrings(extractQuantity(list), docX, energyRowY, textStyle);
  }

  @override
  pw.Widget generateDoB() {
    var date = dateOfBirth.split("/");
    var month = "";
    var day = "";
    var year = "";
    if (date.length == 3) {
      month = date[0];
      day = date[1];
      year = date[2];
    }
    return pw.Row(
      children: <pw.Widget>[
        pw.Container(
          // This positions the X coord of name field
          width: dobX,
          height: docY,
        ),
        pw.Column(
          // Helps positions the Y coord of name
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: <pw.Widget>[
            pw.Container(
              width: docX,
              height: dobY,
            ),
            pw.Row(children: <pw.Widget>[
              pw.Text(month, style: textStyle),
              pw.Container(width: dobDayXOffset, height: 0),
              pw.Text(day, style: textStyle),
              pw.Container(width: dobYearXOffset, height: 0),
              pw.Text(year, style: textStyle),
            ]),
          ],
        ),
      ],
    );
  }

  // This builds the entire pdf in one go
  @override
  pw.Document build() {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: pageFormat,
        build: (pw.Context context) {
          return pw.FullPage(
              ignoreMargins: true,
              child: pw.Stack(
                children: <pw.Widget>[
                  pw.Image(pokemonFormImage), // The actual PDF

                  pw.Row(
                    children: <pw.Widget>[
                      pw.Container(
                        // This positions the X coord of name field
                        width: nameX,
                        height: docY,
                      ),
                      pw.Column(
                        // Helps positions the Y coord of name
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Container(
                            width: docX,
                            height: nameY,
                          ),
                          pw.Text(name, style: textStyle)
                        ],
                      ),
                    ],
                  ),

                  // Player ID
                  pw.Row(
                    children: <pw.Widget>[
                      pw.Container(
                        // This positions the X coord of name field
                        width: playerIdX,
                        height: docY,
                      ),
                      pw.Column(
                        // Helps positions the Y coord of playerId
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Container(
                            width: docX,
                            height: playerIdY,
                          ),
                          pw.Text(playerId, style: textStyle)
                        ],
                      ),
                    ],
                  ),

                  // Date of Birth
                  generateDoB(),

                  // The Deck related information
                  pw.Row(children: <pw.Widget>[
                    // For Pokemon
                    pw.Container(
                      // Empty child to push the text to the right
                      width: nameFieldX,
                      height: docY,
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: generatePokemonColumn(),
                    ),
                  ]),
                  pw.Row(children: <pw.Widget>[
                    // For Pokemon Quantities
                    pw.Container(
                      // Empty child to push the text to the right
                      width: quantityFieldX,
                      height: docY,
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: generatePokemonQuantity(),
                    ),
                  ]),
                  pw.Row(children: <pw.Widget>[
                    // For Pokemon Set Name
                    pw.Container(
                      // Empty child to push the text to the right
                      width: pokemonSetRowX,
                      height: docY,
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: generatePokemonSet(),
                    ),
                  ]),
                  pw.Row(
                    // For Trainers
                    children: <pw.Widget>[
                      pw.Container(
                        // Empty child to push the text to the right
                        width: nameFieldX,
                        height: docY,
                      ),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: generateTrainersColumn(),
                      ),
                    ],
                  ),
                  pw.Row(children: <pw.Widget>[
                    // For Trainer Quantities
                    pw.Container(
                      // Empty child to push the text to the right
                      width: quantityFieldX,
                      height: docY,
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: generateTrainerQuantity(),
                    ),
                  ]),
                  pw.Row(
                    // For Energies
                    children: <pw.Widget>[
                      pw.Container(
                        // Empty child to push the text to the right
                        width: nameFieldX,
                        height: docY,
                      ),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: generateEnergiesColumn(),
                      ),
                    ],
                  ),
                  pw.Row(children: <pw.Widget>[
                    // For Energy Quantities
                    pw.Container(
                      // Empty child to push the text to the right
                      width: quantityFieldX,
                      height: docY,
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: generateEnergyQuantity(),
                    ),
                  ]),
                ],
              ));
        }));
    return pdf;
  }

  Future<Uint8List> buildPdf() async {
    return await build().save();
  }
}
