import 'package:flutter/material.dart';

/// Models the feedback to the user after the save button is clicked
///
/// notificationText can be null for no feedback
class SaveResponse {
  final String? notificationText;
  final bool isError;

  const SaveResponse({
    this.notificationText,
    this.isError = false,
  });

  /// Returns a appropriate snackbar when forms are saved
  SnackBar? notifyAfterSave() {
    if (notificationText == null) {
      return null;
    }
    return SnackBar(
      content: Text(notificationText!),
      backgroundColor: isError ? Colors.red : null,
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
    );
  }
}

