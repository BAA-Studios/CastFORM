This package houses the business logic for turning decks into pdf generated documents.

## Features

This library wraps around the [pdf](https://pub.dev/packages/pdf) library, and makes use of its PDF-construction
functionality.  
This library takes various input data, and places them in the correct position on top of either A4- or Letter-sized
registration form templates.

## Usage

This package is fairly straightforward to use. Refer to `/example` folder for a working detailed examples that can be
run.

```dart
import 'package:deck_string_parser/deck_string_parser.dart';
import 'package:deck_string_parser/pokemon_pdf.dart';
import 'dart:io';

Future<void> main() async {
  print("Starting PDF Builder");

  var deck = parseDeck(deckString);  // see deck_string_parser local library
  final pokemonDoc = A4Form(
    formTemplate: formTemplate,  // see /example
    textStyle: textStyle,  // see /example
    name: "Ash Ketchum",
    playerId: "1234567890",
    dateOfBirth: "02/20/2002",
    deck: deck,
  );

  final pdf = pokemonDoc.buildPdf();

  final file = File("../example.pdf");
  await file.writeAsBytes(await pdf.save());

  print("Done!");
}
```

## Additional information

Core parsing functionality developed by [Brandon Nguyen](https://github.com/Bratah123).  
Refined by [Amos Chua](https://github.com/KOOKIIEStudios).

This package is intended to be used and included as a core component
of [CastFORM](https://github.com/BAA-Studios/CastFORM). Please direct any queries or bug reports to the issues page of
the CastFORM repository.
