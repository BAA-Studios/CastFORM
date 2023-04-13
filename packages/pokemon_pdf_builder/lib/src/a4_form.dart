import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pokemon_pdf_builder/src/generic_form.dart';
import 'package:pokemon_pdf_builder/src/size.dart';

class A4Form extends GenericForm implements Size {
  @override
  void initCoordinates() {
    super.pageFormat = PdfPageFormat.a4;
    // Page size-related coordinates -------------------------------------------------
    super.docX = 2339;
    super.docY = 1654;

    // This offset tells us where the Pokemon Row on the PDF Starts on the Y-Plane
    super.pokemonRowY = 186;
    super.trainerRowY = 362;
    super.energyRowY = 643;

    super.pokemonSetRowX = 465;

    // Name offset
    super.nameX = 85;
    super.nameY = 71;

    // PlayerId offsets
    super.playerIdX = 273;
    super.playerIdY = 71;

    // DoB offsets
    super.dobX = 488; // Indicates the X of the month
    super.dobY = 71;
    super.dobDayXOffset = 16; // This is dobX + thisOffset
    super.dobYearXOffset = 18; // dobX + dobDayXOffset + thisOffset

    // Deck related fields
    super.nameFieldX = 289;
    super.quantityFieldX = 263;
  }

  A4Form({
    required Uint8List formTemplate,
    required ByteData font,
  }) : super(
    formTemplate: formTemplate,
    font: font,
  ) {
    initCoordinates();
  }
}