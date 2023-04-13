import 'package:flutter/foundation.dart';
import 'package:castform/constants.dart';
import 'package:castform/models/user.dart';

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

  void setDeckString(String? deckString) {
    this.deckString = deckString;
    notifyListeners();
  }

  void setPaperType(PaperType? paperType) {
    this.paperType = paperType;
    notifyListeners();
  }

  void toggleOpenInExplorer() {
    isOpenInExplorer = !(isOpenInExplorer ?? false);
    notifyListeners();
  }
}