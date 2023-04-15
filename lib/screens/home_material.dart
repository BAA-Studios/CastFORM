import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:castform/providers/user_provider.dart';
import 'package:castform/screens/document.dart';
import 'package:castform/screens/form_column.dart';


/// Holds the UI layout for the home page, with Material design
class HomeMaterial extends StatefulWidget {
  const HomeMaterial({Key? key}) : super(key: key);

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
  if (Platform.isWindows) {
    return const WindowsScreen();
  }
  if (Platform.isAndroid) {
    return const AndroidScreen();
  }
  throw UnsupportedError("This app is only intended to run on Windows or Android");
}

class AndroidScreen extends StatelessWidget {
  const AndroidScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Implement Android home screen & routing
    return const Placeholder();
  }
}

class WindowsScreen extends StatelessWidget {
  const WindowsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(  // Left side for forms; right side for live preview
      children: const [
        Flexible(
          child: FormColumn(),
        ),
        Expanded(
          flex: 2,
          child: Document(),
        ),
      ],
    );
  }
}
