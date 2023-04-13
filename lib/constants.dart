import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum PaperType { a4, letter }

// 125 years
const Duration maximumHumanLifespan = Duration(days: 45625);

const defaultPadding = EdgeInsets.all(8.0);

const defaultBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(8.0)),
);


late ByteData font;
late Uint8List formTemplate;

void initPdfConstants() {
  rootBundle.load("assets/fonts/RobotoSlab-Regular.ttf").then((value) => font = value);
  rootBundle
      .load("assets/form_templates/pokemon_decklist_a4.webp")
      .then((value) => formTemplate = value.buffer.asUint8List());
}

const aboutText = Text(
    "CastFORM is a free and easy to use tool for automatic filling out of Pokemon "
        "tournament registration sheets!\n"
        "\n"
        "Put together with love from Brandon Nguyen and Amos Chua of BAA Studios!\n"
        "If you enjoy our work, do follow us on GitHub; if you're feeling generous, you can "
        "drop us some spare change for a coffee on ko-fi too!"
);