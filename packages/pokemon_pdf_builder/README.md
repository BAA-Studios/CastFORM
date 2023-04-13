This package houses the business logic for turning decks into pdf generated documents.

## Features

N/A

## Getting started

N/A

## Usage

This package is fairly straightforward to use. Refer to `/example` folder for a console-based workflow.

```dart
import 'package:deck_string_parser/deck_string_parser.dart';
import 'package:deck_string_parser/pokemon_pdf.dart';
import 'dart:io';

Future<void> main() async {
  print("Starting PDF Builder");

  var deck = parseDeck(deckString);
  final pokemonDoc = PokemonPdf(pokemonFormImage: "pokemon_decklist_a4", deck: deck);

  final pdf = pokemonDoc.build();

  final file = File("../example.pdf");
  await file.writeAsBytes(await pdf.save());

  print("Done!");
}
```

## Additional information

Core parsing functionality developed by [Brandon Nguyen](https://github.com/Bratah123).

This package is intended to be used and included as a core component
of [CastFORM](https://github.com/BAA-Studios/CastFORM). Please direct any queries or bug reports to the issues page of
the CastFORM repository.
