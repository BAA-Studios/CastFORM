import 'package:castform/constants.dart';
import 'package:castform/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeckField extends StatefulWidget {
  const DeckField({super.key});

  @override
  State<DeckField> createState() => _DeckFieldState();
}

class _DeckFieldState extends State<DeckField> {
  final _deckController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _deckController,
      decoration: InputDecoration(
        labelText: "Deck String",
        hintText: "Supports PTCGO, PTCGL, and Limitless formats",
        border: defaultBorder,
        suffixIcon: IconButton(
          onPressed: () => {
            _deckController.clear(),
            context.read<UserProvider>().setDeckString(""),
          },
          icon: const Icon(Icons.clear),
        ),
        alignLabelWithHint: true,
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
      onChanged: (String? value) =>
          context.read<UserProvider>().setDeckString(value),
      onSaved: (String? value) =>
          context.read<UserProvider>().setDeckString(value),
    );
  }
}
