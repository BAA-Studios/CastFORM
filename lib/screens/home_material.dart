import 'package:flutter/material.dart';

/// Holds the UI layout for the home page, with Material design
class HomeMaterial extends StatefulWidget {
  const HomeMaterial({Key? key}) : super(key: key);

  @override
  State<HomeMaterial> createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(  // Left side for forms; right side for live preview
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // children: [],
      ),
    );
  }
}
