import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:castform/providers/user_provider.dart';
import 'package:castform/screens/document.dart';
import 'package:castform/screens/form_column.dart';


/// Holds the UI layout for the home page, with Material design
class HomeMaterial extends StatefulWidget {
  const HomeMaterial({super.key});

  @override
  State<HomeMaterial> createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: Scaffold(
        body: SafeArea(
          child: getHomeScreen(),
        ),
      ),
    );
  }
}

StatelessWidget getHomeScreen() {
  if (Platform.isWindows || Platform.isLinux) {
    return const WindowsScreen();
  }
  if (Platform.isAndroid) {
    return const AndroidScreen();
  }
  throw UnsupportedError("This app is only intended to run on Windows, Ubuntu, or Android");
}

class AndroidScreen extends StatelessWidget {
  const AndroidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Implement Android home screen & routing
    return const Placeholder();
  }
}

class WindowsScreen extends StatelessWidget {
  const WindowsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(  // Left side for forms; right side for live preview
      children: [
        Flexible(
          flex: 6,
          child: FormColumn(),
        ),
        Expanded(
          flex: 10,
          child: Document(),
        ),
      ],
    );
  }
}
