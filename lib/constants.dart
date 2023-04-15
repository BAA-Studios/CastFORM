import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:package_info_plus/package_info_plus.dart';

enum PaperType { a4, letter }

// 125 years
const Duration maximumHumanLifespan = Duration(days: 45625);

const defaultPadding = EdgeInsets.all(8.0);

const defaultBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(8.0)),
);


pw.TextStyle? formTextStyle;
pw.Image? formTemplate;

void initPdfConstants() {
  rootBundle
      .load("assets/fonts/RobotoSlab-Regular.ttf")
      .then((value) {
    pw.Font font = pw.Font.ttf(value);
    formTextStyle = pw.TextStyle(font: font, fontSize: 10.0);
  });
  rootBundle
      .load("assets/form_templates/pokemon_decklist_a4.webp")
      .then((value) {
    formTemplate = pw.Image(pw.MemoryImage(value.buffer.asUint8List()));
      });
}

String? appName;
String? appVersion;

void initPackageInfo() {
  PackageInfo.fromPlatform().then((packageInfo) {
    appName = packageInfo.appName;
    appVersion = packageInfo.version;
  });
}

const aboutText = Text(
    "CastFORM is a free and easy to use tool for automatic filling out of Pokemon "
        "tournament registration sheets!\n"
        "\n"
        "Put together with love from Brandon Nguyen and Amos Chua of BAA Studios!\n"
        "If you enjoy our work, do follow us on GitHub; if you're feeling generous, you can "
        "buy us a coffee on ko-fi too!"
);