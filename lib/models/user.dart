import 'package:castform/constants.dart';

class User {
  String? playerName = "";
  String? playerId = "";
  String? dateOfBirth;
  String? deckString = "";
  PaperType? paperType = PaperType.a4;
  bool? isOpenInExplorer = false;

  bool isA4() {
    if (paperType == PaperType.a4) {
      return true;
    }
    return false;
  }

  save() {
    // TODO: Replace with folder selection logic & PDF saving logic
    print("Form sucessfully submitted");
  }
}