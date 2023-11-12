import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:castform/constants.dart';
import 'package:castform/models/save_feedback.dart';
import 'package:deck_string_parser/deck_string_parser.dart';
import 'package:pokemon_pdf_builder/pokemon_pdf.dart';

class User {
  String? playerName = "";
  String? playerId = "";
  String? dateOfBirth;
  Division? division = Division.none;
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

  /// Attempts to save the input data as PDF
  ///
  /// Returns empty string if successful; null for no feedback;
  /// and string for error message
  Future<SaveResponse> save() async {
    // Deck validation
    String cachedDeckString = deckString ?? "";
    if (!isValidDeckString(cachedDeckString)) {
      return const SaveResponse(
          notificationText: "Deck does not contain 60 cards!", isError: true);
    }

    // Open save-as dialog, which gives us the full save path as string
    var dateTime = DateTime.now();
    String? outputFilePath = await FilePicker.platform.saveFile(
      dialogTitle: "Please select an output file:",
      fileName:
          "pokemon_registration_sheet_${dateTime.month}${dateTime.day}${dateTime.second}.pdf",
    );

    if (outputFilePath == null) {
      // User canceled the picker
      return const SaveResponse();
    }

    // Generate the PDF with the latest attributes
    Deck deck;
    deck = parseDeck(cachedDeckString);

    dynamic formHandler;
    if (isA4()) {
      formHandler = A4Form(
        formTemplate: a4FormTemplate,
        textStyle: formTextStyle,
        unicodeTextStyle: unicodeTextStyle,
        name: playerName ?? "",
        playerId: playerId ?? "",
        division: division ?? Division.none,
        dateOfBirth: dateOfBirth ?? "",
        deck: deck,
      );
    } else {
      formHandler = LetterForm(
        formTemplate: letterFormTemplate,
        textStyle: formTextStyle,
        unicodeTextStyle: unicodeTextStyle,
        name: playerName ?? "",
        playerId: playerId ?? "",
        division: division ?? Division.none,
        dateOfBirth: dateOfBirth ?? "",
        deck: deck,
      );
    }

    // Export as PDF
    try {
      await File(outputFilePath).writeAsBytes(await formHandler.buildPdf());
    } catch (_) {
      return const SaveResponse(
          notificationText: "Unable to export as PDF!", isError: true);
    }
    // show in Explorer
    if (openInExplorer ?? false) {
      // strip the trailing file name
      var temp = outputFilePath.split("\\");
      var directoryPath =
          "file:/${temp.sublist(0, temp.length - 1).join("\\")}";
      final Uri uri = Uri.parse(directoryPath);

      if (!await launchUrl(uri)) {
        return const SaveResponse(
            notificationText: "Unable to open in Explorer!", isError: true);
      }
    }

    // show in PDF viewer
    if (openInViewer ?? false) {
      final Uri uri = Uri.file(outputFilePath);
      if (!await launchUrl(uri)) {
        return const SaveResponse(
            notificationText: "Unable to open output file!", isError: true);
      }
    }
    return const SaveResponse(notificationText: "Successfully saved as PDF!");
  }
}
