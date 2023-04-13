import 'package:castform/screens/document.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:castform/constants.dart';
import 'package:castform/providers/user_provider.dart';
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
    initPdfConstants();
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: Scaffold(
        body: SafeArea(
          child: Row(  // Left side for forms; right side for live preview
            children: const [
              Flexible(
                child: FormColumn(),
              ),
              Expanded(
                flex: 2,
                child: Document(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
