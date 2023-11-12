import 'package:castform/constants.dart';
import 'package:castform/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class A4Radio extends StatelessWidget {
  const A4Radio({super.key});

  @override
  Widget build(BuildContext context) {
    return RadioListTile<PaperType>(
      title: const Text("A4"),
      value: PaperType.a4,
      groupValue: context.select<UserProvider, PaperType?>(
          (userProvider) => userProvider.paperType),
      onChanged: (PaperType? value) =>
          context.read<UserProvider>().setPaperType(value),
      dense: true,
    );
  }
}

class LetterRadio extends StatelessWidget {
  const LetterRadio({super.key});

  @override
  Widget build(BuildContext context) {
    return RadioListTile<PaperType>(
      title: const Text("Letter"),
      value: PaperType.letter,
      groupValue: context.select<UserProvider, PaperType?>(
          (userProvider) => userProvider.paperType),
      onChanged: (PaperType? value) =>
          context.read<UserProvider>().setPaperType(value),
      dense: true,
    );
  }
}
