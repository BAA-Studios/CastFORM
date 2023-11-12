import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:deck_string_parser/deck_string_parser.dart';
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
    super.dobX = 490; // Indicates the X of the month
    super.dobY = 71;
    super.dobDayXOffset = 20; // This is dobX + thisOffset
    super.dobYearXOffset = 17; // dobX + dobDayXOffset + thisOffset

    // Division Checkmark offsets
    super.divX = 367;
    super.divY = 108;
    super.divYOffset = 13;

    // Deck related fields
    super.nameFieldX = 289;
    super.quantityFieldX = 263;
  }

  A4Form({
    super.formTemplate,
    super.textStyle,
    super.name,
    super.playerId,
    super.dateOfBirth,
    super.division,
    super.deck,
  }) {
    initCoordinates();
  }
}