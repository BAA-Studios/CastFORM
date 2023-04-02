import 'package:test/test.dart';

import 'package:deck_string_parser/src/deck.dart';
import 'package:deck_string_parser/src/energy.dart';
import 'package:deck_string_parser/src/parser.dart';
import 'package:deck_string_parser/src/pokemon.dart';
import 'package:deck_string_parser/src/trainer.dart';

void main() {
  group('Initial string processing', () {

    test('`crudeSplit` correctly splits a PTCGO deck string into a list of 3 elements', () {
      // expect(fooBar, isTrue);
    });

    test('`crudeSplit` correctly splits a PTCGL deck string into a list of 4 elements', () {
      // expect(fooBar, isTrue);
    });

    test('`handlePTCGLFormat` returns a list of 3 elements for PTCGO decks', () {
      // expect(fooBar, isTrue);
    });

    test('`handlePTCGLFormat` returns a list of 3 elements for PTCGL decks', () {
      // expect(fooBar, isTrue);
    });

    test('`strip` removes the header properly', () {
      // check number of lines/elements
      // expect(fooBar, isTrue);
    });

    test('`fineSplit` splits and formats a given section', () {
      // check number of lines/elements
      // expect(fooBar, isTrue);
    });
  });

  group('Data extraction', () {

    test('`parsePokemonCards` extracts the correct number of cards from the crude deck list', () {
      // expect(fooBar, isTrue);
    });

    test('`parseTrainerCards` extracts the correct number of cards from the crude deck list', () {
      // expect(fooBar, isTrue);
    });

    test('`parseEnergyCards` extracts the correct number of cards from the crude deck list', () {
      // expect(fooBar, isTrue);
    });

    test('`parsePokemonCards` extracts the first card correctly as a Pokemon object', () {
      // expect(fooBar, isTrue);
    });

    test('`parseTrainerCards` extracts the first card correctly as a Trainer object', () {
      // expect(fooBar, isTrue);
    });

    test('`parseEnergyCards` extracts the first card correctly as a Energy object', () {
      // expect(fooBar, isTrue);
    });
  });
}
