import 'package:castform/constants.dart';
import 'package:castform/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon_pdf_builder/pokemon_pdf.dart';

class UserProvider extends User with ChangeNotifier {
  void setName(String? playerName) {
    this.playerName = playerName;
    notifyListeners();
  }

  void setId(String? playerId) {
    this.playerId = playerId;
    notifyListeners();
  }

  void setDate(String? dateOfBirth) {
    this.dateOfBirth = dateOfBirth;
    notifyListeners();
  }

  void setDivision(Division? division) {
    this.division = division;
    notifyListeners();
  }

  void setDeckString(String? deckString) {
    this.deckString = deckString;
    notifyListeners();
  }

  void setPaperType(PaperType? paperType) {
    this.paperType = paperType;
    notifyListeners();
  }

  void toggleOpenInExplorer() {
    openInExplorer = !(openInExplorer ?? false);
    notifyListeners();
  }

  void toggleOpenFile() {
    openInViewer = !(openInViewer ?? false);
    notifyListeners();
  }
}
