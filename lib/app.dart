import 'package:flutter/material.dart';
import 'package:castform/screens/home_material.dart';
import 'package:castform/style.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      darkTheme: darkTheme,
      home: const HomeMaterial(),  // Google-style for Windows
      // home: HomeCupertino(),  // Apple-style for macOS
    );
  }
}