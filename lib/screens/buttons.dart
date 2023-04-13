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
          context.read<UserProvider>().save();
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
          title: const Text("About CastFORM"),
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
