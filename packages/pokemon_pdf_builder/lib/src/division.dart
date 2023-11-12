enum Division { auto, junior, senior, masters, none }

int getCurrentYear() {
  return DateTime.now().year;
}

Division getDivision(int birthYear) {
  var years = getCurrentYear() - birthYear;
  // brackets: 12 16 17
  if (years <= 12) {
    return Division.junior;
  }
  if (years <= 16) {
    return Division.senior;
  }
  return Division.masters;
}
