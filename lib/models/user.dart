import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:castform/constants.dart';
import 'package:deck_string_parser/deck_string_parser.dart';
import 'package:pokemon_pdf_builder/pokemon_pdf.dart';

class User {
  String? playerName = "";
  String? playerId = "";
  String? dateOfBirth;
  String? deckString = "";
  PaperType? paperType = PaperType.a4;
  bool? openInExplorer = false;
  bool? openInViewer = false;

  bool isA4() {
    if (paperType == PaperType.a4) {
      return true;
    }
    return false;
  }

  void save() async {
    // Open save-as dialog, which gives us the full save path as string
    var dateTime = DateTime.now();
    String? outputFilePath = await FilePicker.platform.saveFile(
      dialogTitle: "Please select an output file:",
      fileName: "pokemon_registration_sheet_${dateTime.month}${dateTime.day}${dateTime.second}.pdf",
    );

    if (outputFilePath == null) {
      // User canceled the picker
      return;
    }
    // Generate the PDF with the latest attributes
    GenericForm formHandler;
    if (isA4()) {
      formHandler = getA4FormHandler(formTemplate, font);
    } else {
      formHandler = getLetterFormHandler(formTemplate, font);
    }

    var deck = deckString ?? "";
    if (deck.isNotEmpty) {
      formHandler.deck = parseDeck(deck);
    } else {
      // TODO: snackbar for failed save
      return;
    }
    formHandler.name = playerName ?? "";
    formHandler.playerId = playerId ?? "";
    formHandler.dateOfBirth = dateOfBirth ?? "";
    await File(outputFilePath).writeAsBytes(await formHandler.buildPdf());
    // TODO: Snackbar for save result

    // show in Explorer
    if (openInExplorer ?? false) {
      // strip the trailing file name
      var temp = outputFilePath.split("\\");
      var directoryPath = "file:/${temp.sublist(0, temp.length - 1).join("\\")}";
      final Uri uri = Uri.parse(directoryPath);

      if (!await launchUrl(uri)) {
        // TODO: snackbar for failed open
      }
    }

    // show in PDF viewer
    if (openInViewer ?? false) {
      final Uri uri = Uri.file(outputFilePath);
      if (!await launchUrl(uri)) {
        // TODO: snackbar for failed open
      }
    }
  }
}