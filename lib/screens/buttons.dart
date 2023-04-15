import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:castform/constants.dart';
import 'package:castform/providers/user_provider.dart';

class SaveButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SaveButton({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final form = formKey.currentState;
        if (form!.validate()) {
          form.save();

          // Attempts to export as PDF
          context.read<UserProvider>().save().then((response) {
            // Feedback to user whether save was successful
            SnackBar? feedback = response.notifyAfterSave();
            if (feedback != null) {
              ScaffoldMessenger.of(context).showSnackBar(feedback);
            }
          });
        }
      },
      child: const Text("Save"),
    );
  }
}

class AboutButton extends StatelessWidget {
  const AboutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("About $appName v$appVersion"),
          content: aboutText,
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, "Close"),
              child: const Text("Close"),
            ),
          ],
        ),
      ),
      child: const Text("About"),
    );
  }
}
