import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pokemon_pdf_builder/src/generic_form.dart';
import 'package:pokemon_pdf_builder/src/size.dart';

class LetterForm extends GenericForm implements Size {
  @override
  void initCoordinates() {
    super.pageFormat = PdfPageFormat.letter;
    // Page size-related coordinates -------------------------------------------------
    super.docX = 2200;
    super.docY = 1700;

    // This offset tells us where the Pokemon Row on the PDF Starts on the Y-Plane
    super.pokemonRowY = 194;
    super.trainerRowY = 370.5;
    super.energyRowY = 652.5;

    super.pokemonSetRowX = 475;

    // Name offset
    super.nameX = 92;
    super.nameY = 68;

    // PlayerId offsets
    super.playerIdX = 280;
    super.playerIdY = 68;

    // DoB offsets
    super.dobX = 495; // Indicates the X of the month
    super.dobY = 68;
    super.dobDayXOffset = 17; // This is dobX + thisOffset
    super.dobYearXOffset = 18; // dobX + dobDayXOffset + thisOffset

    // Deck related fields
    super.nameFieldX = 297;
    super.quantityFieldX = 274;
  }

  LetterForm({
    Uint8List? formTemplate,
    ByteData? font,
  }) : super(
    formTemplate: formTemplate,
    font: font,
  ) {
    initCoordinates();
  }
}