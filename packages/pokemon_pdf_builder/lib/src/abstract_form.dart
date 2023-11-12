import 'dart:typed_data';

import 'package:pdf/widgets.dart' as pw;

abstract class AbstractForm {
  // Deck String fields --------------------------------------------------------
  List<pw.Widget> generatePokemonColumn();

  List<pw.Widget> generatePokemonQuantity();

  List<pw.Widget> generatePokemonSet();

  List<pw.Widget> generateTrainersColumn();

  List<pw.Widget> generateTrainerQuantity();

  List<pw.Widget> generateEnergiesColumn();

  List<pw.Widget> generateEnergyQuantity();

  // Other fields --------------------------------------------------------------
  pw.Widget generateDoB();

  pw.Widget generateDivisions();

  // PDF generation ------------------------------------------------------------
  pw.Document build();

  Future<Uint8List> buildPdf(); // builds and saves
}
