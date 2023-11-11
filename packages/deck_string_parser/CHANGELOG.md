## 1.4.0
- Add support up to Pokemon Trading Card Game Classic
  -  Includes support for Paradox Rift
- Migrate to new ForeCAST-based tooling for set abbreviations

## 1.3.2
- Add support for trailing `PH` in PTCGL representation of full/alt art trainer cards' names
- Merge similar energy cards into the same entry

## 1.3.1
- Routine updating of list of known sets (via Bulbapedia as of 9th July 2023)

## 1.3.0
- Add `PAL` to list of known sets
- Add support for PTCGL tokens

## 1.2.0
- Holographic cards (sometimes denoted with a trailing `PH`) will now automatically merge into existing lines with otherwise non-holographic cards
  - Similar to same-name trainer cards in v1.1.0
- Add try-parse to public API, so allow for deck string validation

## 1.1.0 Feature Update
### New Features
- Merge same-name trainer cards into the same entry
  - Sometimes the same trainers can appear in different sets; for competition purposes, these are considered equal  
- Add function to check the total number of cards in the deck
- LimitlessTCG format support
- Expand unit test comprehensiveness
  - Check same-name trainer card mergers
  - Check deck validation functionality
  - Expand current test suite to include similar tests for LimitlessTCG format

### Bug Fixes
- Handling for LimitlessTCG non-header format
  - Erroneously returning empty buffer
  - Stray negation in conditional (resulting in checking for the opposite condition)
- Missing delimiter in unit test variable

## 1.0.0 Feature Update
### New Features
- Implement core parsing functionality (MVP milestone 1)
  - PTCGO format support
  - PTCGL format support
    - Strips out `PH` tag for indicating holo cards
    - Strips out trailing card tally
- Implement full unit test coverage for core parsing functionality (MVP milestone 2)
- Example code provided (MVP milestone 3)

## 0.0.1

- Initialise package with Dart defaults
