import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:castform/providers/user_provider.dart';

class OpenFileOnSave extends StatelessWidget {
  const OpenFileOnSave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text(
        "Open file upon saving",
        textAlign: TextAlign.start,
      ),
      dense: true,
      value: context.select<UserProvider, bool?>((userProvider) => userProvider.openInViewer) ?? false,
      onChanged: (_) => context.read<UserProvider>().toggleOpenFile(),
    );
  }
}
