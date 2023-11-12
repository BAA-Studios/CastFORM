import 'package:deck_string_parser/deck_string_parser.dart';
import 'package:pdf/widgets.dart' as pw;

/// Convert list of card to list of card names
List<String> extractName(List<Card> cards) {
  return cards.map((card) => card.name).toList();
}

/// Convert list of card to list of card quantities
List<String> extractQuantity(List<Card> cards) {
  return cards.map((card) => card.quantity).toList();
}

/// Convert list of card to list of card sets
List<String> extractSet(List<Card> cards) {
  return cards.map((card) => card.set).toList();
}

/// Creates a list of pdf widgets from a list of strings
List<pw.Widget> populateWithStrings(
  List<String> cardAttributes,
  double width,
  double height,
  pw.TextStyle? textStyle,
) {
  List<pw.Widget> buffer = [
    pw.Container(
        // Empty child to push the text down
        width: width,
        height: height),
    ...cardAttributes.map((element) => pw.Text(element, style: textStyle)),
  ];
  return buffer;
}
