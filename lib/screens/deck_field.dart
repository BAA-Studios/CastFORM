import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:castform/constants.dart';
import 'package:castform/providers/user_provider.dart';

class DeckField extends StatefulWidget {
  const DeckField({Key? key}) : super(key: key);

  @override
  State<DeckField> createState() => _DeckFieldState();
}

class _DeckFieldState extends State<DeckField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Deck String",
        hintText: "Supports PTCGO, PTCGL, and Limitless formats",
        border: defaultBorder,
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Deck string is a required field!";
        }
        return null;
      },
      maxLines: null,
      expands: true,
      keyboardType: TextInputType.multiline,
      onChanged: (String? value) => context.read<UserProvider>().setDeckString(value),
      onSaved: (String? value) => context.read<UserProvider>().setDeckString(value),
    );
  }
}
