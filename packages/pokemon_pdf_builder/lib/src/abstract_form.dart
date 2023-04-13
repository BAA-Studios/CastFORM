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

  // PDF generation ------------------------------------------------------------
  pw.Document build();
}