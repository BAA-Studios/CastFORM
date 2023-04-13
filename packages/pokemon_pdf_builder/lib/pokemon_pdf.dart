/// Utility library for handling PDF creation
library pokemon_pdf;

import 'dart:typed_data';

import 'package:pokemon_pdf_builder/src/a4_form.dart';

A4Form getA4FormHandler(Uint8List formTemplate, ByteData font) {
  return A4Form(formTemplate: formTemplate, font: font);
}