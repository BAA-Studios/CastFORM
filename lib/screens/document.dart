import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:castform/constants.dart';
import 'package:castform/providers/user_provider.dart';
import 'package:deck_string_parser/deck_string_parser.dart';
import 'package:pokemon_pdf_builder/pokemon_pdf.dart';


class Document extends StatefulWidget {
  const Document({Key? key}) : super(key: key);

  @override
  State<Document> createState() => _DocumentState();
}

class _DocumentState extends State<Document> {
  @override
  Widget build(BuildContext context) {
    /*String deckString = context.select<UserProvider, String?>((userProvider) => userProvider.deckString) ?? "";
    String name = context.select<UserProvider, String?>((userProvider) => userProvider.playerName) ?? "";
    String playerId = context.select<UserProvider, String?>((userProvider) => userProvider.playerId) ?? "";
    String dateOfBirth = context.select<UserProvider, String?>((userProvider) => userProvider.dateOfBirth) ?? "";*/
    String deckString = context.watch<UserProvider>().deckString ?? "";
    String name = context.watch<UserProvider>().playerName ?? "";
    String playerId = context.watch<UserProvider>().playerId ?? "";
    String dateOfBirth = context.watch<UserProvider>().dateOfBirth ?? "";
    return PdfPreview(
        build: (_) {
          // Create a fresh render every time a change is detected
          // Preview in A4 only
          GenericForm document = getA4FormHandler(formTemplate, font);

          if (deckString.isNotEmpty) {
            document.deck = parseDeck(deckString);
          }
          document.name = name;
          document.playerId = playerId;
          document.dateOfBirth = dateOfBirth;
          return document.buildPdf();
        }
    );
  }
}
