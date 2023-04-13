library pokemon_pdf;

import 'dart:io';
import 'package:deck_string_parser/deck_string_parser.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PokemonPdf {
  Deck deck;

  String name = "";
  String playerId = "";
  String date = "";

  static const double fontSize = 10;

  // A4 Doc related coordinates -------------------------------------------------
  static const double docA4X = 2339;
  static const double docA4Y = 1654;

  // This offset tells us where the Pokemon Row on the PDF Starts on the Y-Plane
  static const double pokemonRowY = 186;
  static const double trainerRowY = 362;
  static const double energyRowY = 643;

  static const double pokemonSetRowX = 465;

  // Name offset
  static const double nameX = 85;
  static const double nameY = 71;

  // PlayerId offsets
  static const double playerIdX = 273;
  static const double playerIdY = 71;

  // Deck related fields
  static const double nameFieldX = 289;
  // ---------------------------------------------------------------------------



  final _ttf = pw.Font.ttf(
      File("${Directory.current.path}/lib/assets/RobotoSlab-Regular.ttf")
          .readAsBytesSync()
          .buffer
          .asByteData());

  PokemonPdf({
    required this.deck,
  });

  List<pw.Widget> _generatePokemonColumn() {
    List<pw.Widget> pokemons = [];
    pokemons.add(
      pw.Container( // Empty child to push the text down
          width: docA4X,
          height: pokemonRowY
      )
    );
    for (var element in deck.pokemonList) {
      pokemons.add(
        pw.Text(
          element.name,
          style: pw.TextStyle(font: _ttf, fontSize: fontSize),
        ));
    }
    return pokemons;
  }

  List<pw.Widget> _generatePokemonQuantity() {
    List<pw.Widget> pokemons = [];
    pokemons.add(
        pw.Container( // Empty child to push the text down
            width: docA4X,
            height: pokemonRowY
        )
    );
    for (var element in deck.pokemonList) {
      pokemons.add(
          pw.Text(
            element.quantity,
            style: pw.TextStyle(font: _ttf, fontSize: fontSize),
          ));
    }
    return pokemons;
  }

  List<pw.Widget> _generatePokemonSet() {
    List<pw.Widget> pokemons = [];
    pokemons.add(
        pw.Container( // Empty child to push the text down
            width: docA4X,
            height: pokemonRowY
        )
    );
    for (var element in deck.pokemonList) {
      pokemons.add(
          pw.Text(
            element.set,
            style: pw.TextStyle(font: _ttf, fontSize: fontSize),
          ));
    }
    return pokemons;
  }

  List<pw.Widget> _generateTrainersColumn() {
    List<pw.Widget> trainers = [];
    trainers.add(
        pw.Container( // Empty child to push the text down
            width: docA4X,
            height: trainerRowY
        )
    );
    for (var element in deck.trainerList) {
      trainers.add(
          pw.Text(
            element.name,
            style: pw.TextStyle(font: _ttf, fontSize: fontSize),
          ));
    }
    return trainers;
  }

  List<pw.Widget> _generateTrainerQuantity() {
    List<pw.Widget> trainers = [];
    trainers.add(
        pw.Container( // Empty child to push the text down
            width: docA4X,
            height: trainerRowY
        )
    );
    for (var element in deck.trainerList) {
      trainers.add(
          pw.Text(
            element.quantity,
            style: pw.TextStyle(font: _ttf, fontSize: fontSize),
          ));
    }
    return trainers;
  }

  List<pw.Widget> _generateEnergiesColumn() {
    List<pw.Widget> energies = [];
    energies.add(
        pw.Container( // Empty child to push the text down
            width: docA4X,
            height: energyRowY
        )
    );
    for (var element in deck.energyList) {
      energies.add(
          pw.Text(
            element.name,
            style: pw.TextStyle(font: _ttf, fontSize: fontSize),
          ));
    }
    return energies;
  }

  List<pw.Widget> _generateEnergyQuantity() {
    List<pw.Widget> energies = [];
    energies.add(
        pw.Container( // Empty child to push the text down
            width: docA4X,
            height: energyRowY
        )
    );
    for (var element in deck.energyList) {
      energies.add(
          pw.Text(
            element.quantity,
            style: pw.TextStyle(font: _ttf, fontSize: fontSize),
          ));
    }
    return energies;
  }


  // This builds the entire pdf in one go
  pw.Document build() {
    final pdf = pw.Document();

    final pokemonFormImage = pw.MemoryImage(File("${Directory.current.path}/lib/assets/pokemon_decklist_a4.webp")
        .readAsBytesSync());

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.FullPage(
              ignoreMargins: true,
              child: pw.Stack(
                children: <pw.Widget>[
                  pw.Image(pokemonFormImage), // The actual PDF

                  // Name
                  pw.Row(
                    children: <pw.Widget>[
                      pw.Container( // This positions the X coord of name field
                        width: nameX,
                        height: docA4Y,
                      ),
                      pw.Column( // Helps positions the Y coord of name
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Container(
                            width: docA4X,
                            height: nameY,
                          ),
                          pw.Text(name, style: pw.TextStyle(font: _ttf, fontSize: fontSize))
                        ],
                      ),
                    ],
                  ),

                  // Player ID
                  pw.Row(
                    children: <pw.Widget>[
                      pw.Container( // This positions the X coord of name field
                        width: playerIdX,
                        height: docA4Y,
                      ),
                      pw.Column( // Helps positions the Y coord of playerId
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Container(
                            width: docA4X,
                            height: playerIdY,
                          ),
                          pw.Text(playerId, style: pw.TextStyle(font: _ttf, fontSize: fontSize))
                        ],
                      ),
                    ],
                  ),

                  // The Deck related information
                  pw.Row(children: <pw.Widget>[ // For Pokemon
                    pw.Container(
                      // Empty child to push the text to the right
                      width: nameFieldX,
                      height: docA4Y,
                    ),
                    pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: _generatePokemonColumn(),
                    ),
                  ]),
                  pw.Row(children: <pw.Widget>[ // For Pokemon Quantities
                    pw.Container(
                      // Empty child to push the text to the right
                      width: 263,
                      height: docA4Y,
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: _generatePokemonQuantity(),
                    ),
                  ]),
                  pw.Row(children: <pw.Widget>[ // For Pokemon Set Name
                    pw.Container(
                      // Empty child to push the text to the right
                      width: pokemonSetRowX,
                      height: docA4Y,
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: _generatePokemonSet(),
                    ),
                  ]),
                  pw.Row( // For Trainers
                    children: <pw.Widget>[
                      pw.Container(
                        // Empty child to push the text to the right
                        width: nameFieldX,
                        height: docA4Y,
                      ),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: _generateTrainersColumn(),
                      ),
                    ],
                  ),
                  pw.Row(children: <pw.Widget>[ // For Trainer Quantities
                    pw.Container(
                      // Empty child to push the text to the right
                      width: 263,
                      height: docA4Y,
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: _generateTrainerQuantity(),
                    ),
                  ]),
                  pw.Row( // For Energies
                    children: <pw.Widget>[
                      pw.Container(
                        // Empty child to push the text to the right
                        width: nameFieldX,
                        height: docA4Y,
                      ),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: _generateEnergiesColumn(),
                      ),
                    ],
                  ),
                  pw.Row(children: <pw.Widget>[ // For Energy Quantities
                    pw.Container(
                      // Empty child to push the text to the right
                      width: 263,
                      height: docA4Y,
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: _generateEnergyQuantity(),
                    ),
                  ]),
                ],
              ));
        }));
    return pdf;
  }
}
