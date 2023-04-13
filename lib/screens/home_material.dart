import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Row(  // Left side for forms; right side for live preview
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(  // Left side
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: const FormColumn(),
          )
        ],
      ),
    );
  }
}
