import 'package:flutter/material.dart';
import 'screens/home_material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      /* TODO: Redactor to style.dart
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),*/
      home: HomeMaterial(),  // Google-style for Windows
      // home: HomeCupertino(),  // Apple-style for macOS
    );
  }
}