import 'package:castform/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NameField extends StatefulWidget {
  const NameField({super.key});

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: TextFormField(
        controller: _nameController,
        decoration: const InputDecoration(
          labelText: "Player Name",
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Name is a required field!";
          }
          return null;
        },
        onSaved: (_) =>
            context.read<UserProvider>().setName(_nameController.text),
      ),
      onFocusChange: (_) =>
          context.read<UserProvider>().setName(_nameController.text),
    );
  }
}
