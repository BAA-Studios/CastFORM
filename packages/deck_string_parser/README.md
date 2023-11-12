This package houses the business logic for parsing deck strings provided by users into relevant objects.

## Features

PTCGO, PTCGL, and LimitlessTCG deck strings will be processed into `Deck` objects, which have `Pokemon`, `Trainer`,
and `Energy` object
lists as attribute.
These in turn have the relevant data (e.g. name and quantity) as attribute.

## Getting started

No additional third-party libraries are required for use. Simply import `deck_string_parser`, and you may call
the `parseDeck()` function.

## Usage

This package is fairly straightforward to use. Refer to `/example` folder for a console-based workflow.

```dart
import 'package:deck_string_parser/deck_string_parser.dart';

var deck = parseDeck(someDeckString); // convert deck string to deck object
var pokemonList = deck.pokemonList; // access the list of pokemon objects

void printFirstPokemon() {
  print(pokemonList[0].name); // print the name of the first pokemon in the deck
}
```

## Additional information

Core parsing functionality developed by [Amos Chua](https://github.com/KOOKIIEStudios).

This package is intended to be used and included as a core component
of [CastFORM](https://github.com/BAA-Studios/CastFORM). Please direct any queries or bug reports to the issues page of
the CastFORM repository.
