import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:castform/providers/user_provider.dart';

class IdField extends StatefulWidget {
  const IdField({Key? key}) : super(key: key);

  @override
  State<IdField> createState() => _IdFieldState();
}

class _IdFieldState extends State<IdField> {
  final _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: TextFormField(
        controller: _idController,
        decoration: const InputDecoration(
          labelText: "Player ID (Optional)",
        ),
        onSaved: (_) => context.read<UserProvider>().setId(_idController.text),
      ),
      onFocusChange: (_) => context.read<UserProvider>().setId(_idController.text),
    );
  }
}
