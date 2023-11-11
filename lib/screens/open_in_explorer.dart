import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:castform/providers/user_provider.dart';

class OpenInExplorer extends StatelessWidget {
  const OpenInExplorer({super.key});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text(
        "Open folder in Explorer upon saving",
        textAlign: TextAlign.start,
      ),
      dense: true,
      value: context.select<UserProvider, bool?>((userProvider) => userProvider.openInExplorer) ?? false,
      onChanged: (_) => context.read<UserProvider>().toggleOpenInExplorer(),
    );
  }
}
