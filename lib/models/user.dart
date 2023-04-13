import 'package:castform/constants.dart';

class User {
  String? playerName = "";
  String? playerId = "";
  String? dateOfBirth;
  String? deckString = "";
  PaperType? paperType = PaperType.a4;

  save() {
    // TODO: Replace with folder selection logic & PDF saving logic
    print("Form sucessfully submitted");
  }
}