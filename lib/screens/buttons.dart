import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
