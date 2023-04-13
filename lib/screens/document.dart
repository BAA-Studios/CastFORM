import 'package:flutter/foundation.dart';
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
  var _deckString = "";
  var _name = "";
  var _playerId = "";
  var _dateOfBirth = "";
  bool _isDocCached = false;
  late Future<Uint8List> _lastDocument;

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

    // Assume build() is called every frame, omit and useless calls.
    // If no changes were made to the strings, we omit this call
    if (_deckString == deckString &&
        _name == name &&
        _playerId == playerId &&
        _dateOfBirth == dateOfBirth && _isDocCached) {
      return PdfPreview(build: (_) {
        return _lastDocument;
      });
    }
    // Note the new changes
    if (_deckString != deckString) {
      _deckString = deckString;
    }
    if (_name != name) {
      _name = name;
    }
    if (_playerId != playerId) {
      _playerId = playerId;
    }
    if (_dateOfBirth != dateOfBirth) {
      _dateOfBirth = dateOfBirth;
    }
    return PdfPreview(build: (_) {
      // Create a fresh render every time a change is detected
      // Preview in A4 only
      GenericForm document = getA4FormHandler(formTemplate, font);

      if (deckString.isNotEmpty) {
        document.deck = parseDeck(_deckString);
      }
      document.name = _name;
      document.playerId = _playerId;
      document.dateOfBirth = _dateOfBirth;
      _lastDocument = document.buildPdf();
      _isDocCached = true;
      return _lastDocument;
    });
  }
}
