import 'package:castform/constants.dart';
import 'package:castform/providers/user_provider.dart';
import 'package:deck_string_parser/deck_string_parser.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_pdf_builder/pokemon_pdf.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

class Document extends StatefulWidget {
  const Document({super.key});

  @override
  State<Document> createState() => _DocumentState();
}

class _DocumentState extends State<Document> {
  @override
  Widget build(BuildContext context) {
    String deckString = context.select<UserProvider, String?>(
            (userProvider) => userProvider.deckString) ??
        "";
    String name = context.select<UserProvider, String?>(
            (userProvider) => userProvider.playerName) ??
        "";
    String playerId = context.select<UserProvider, String?>(
            (userProvider) => userProvider.playerId) ??
        "";
    String dateOfBirth = context.select<UserProvider, String?>(
            (userProvider) => userProvider.dateOfBirth) ??
        "";
    Division division = context.select<UserProvider, Division?>(
            (userProvider) => userProvider.division) ??
        Division.none;
    /*String deckString = context.watch<UserProvider>().deckString ?? "";
    String name = context.watch<UserProvider>().playerName ?? "";
    String playerId = context.watch<UserProvider>().playerId ?? "";
    String dateOfBirth = context.watch<UserProvider>().dateOfBirth ?? "";*/

    return PdfPreview(
      build: (_) {
        // Create a fresh render every time a change is detected
        // Preview in A4 only
        Deck? deck;
        if (deckString.isNotEmpty && isValidDeckString(deckString)) {
          deck = parseDeck(deckString);
        }
        A4Form document = A4Form(
          formTemplate: a4FormTemplate,
          textStyle: formTextStyle,
          unicodeTextStyle: unicodeTextStyle,
          name: name,
          playerId: playerId,
          dateOfBirth: dateOfBirth,
          division: division,
          deck: deck,
        );

        return document.buildPdf();
      },
      allowPrinting: false,
      allowSharing: false,
      canChangePageFormat: false,
      canChangeOrientation: false,
      canDebug: false,
    );
  }
}
