import 'package:castform/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_pdf_builder/pokemon_pdf.dart';
import 'package:provider/provider.dart';

class AutoRadio extends StatelessWidget {
  const AutoRadio({super.key});

  @override
  Widget build(BuildContext context) {
    return RadioListTile<Division>(
      title: const Text("Auto"),
      value: Division.auto,
      groupValue: context.select<UserProvider, Division?>(
          (userProvider) => userProvider.division),
      onChanged: (Division? value) =>
          context.read<UserProvider>().setDivision(value),
      dense: true,
    );
  }
}

class JuniorRadio extends StatelessWidget {
  const JuniorRadio({super.key});

  @override
  Widget build(BuildContext context) {
    return RadioListTile<Division>(
      title: const Text("Junior"),
      value: Division.junior,
      groupValue: context.select<UserProvider, Division?>(
          (userProvider) => userProvider.division),
      onChanged: (Division? value) =>
          context.read<UserProvider>().setDivision(value),
      dense: true,
    );
  }
}

class SeniorRadio extends StatelessWidget {
  const SeniorRadio({super.key});

  @override
  Widget build(BuildContext context) {
    return RadioListTile<Division>(
      title: const Text("Senior"),
      value: Division.senior,
      groupValue: context.select<UserProvider, Division?>(
          (userProvider) => userProvider.division),
      onChanged: (Division? value) =>
          context.read<UserProvider>().setDivision(value),
      dense: true,
    );
  }
}

class MastersRadio extends StatelessWidget {
  const MastersRadio({super.key});

  @override
  Widget build(BuildContext context) {
    return RadioListTile<Division>(
      title: const Text("Masters"),
      value: Division.masters,
      groupValue: context.select<UserProvider, Division?>(
          (userProvider) => userProvider.division),
      onChanged: (Division? value) =>
          context.read<UserProvider>().setDivision(value),
      dense: true,
    );
  }
}

class NoneRadio extends StatelessWidget {
  const NoneRadio({super.key});

  @override
  Widget build(BuildContext context) {
    return RadioListTile<Division>(
      title: const Text("None"),
      value: Division.none,
      groupValue: context.select<UserProvider, Division?>(
          (userProvider) => userProvider.division),
      onChanged: (Division? value) =>
          context.read<UserProvider>().setDivision(value),
      dense: true,
    );
  }
}
