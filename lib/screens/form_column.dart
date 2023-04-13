import 'package:castform/screens/open_in_explorer.dart';
import 'package:flutter/material.dart';
import 'package:castform/constants.dart';
import 'package:castform/screens/buttons.dart';
import 'package:castform/screens/date_field.dart';
import 'package:castform/screens/deck_field.dart';
import 'package:castform/screens/id_field.dart';
import 'package:castform/screens/name_field.dart';
import 'package:castform/screens/paper_size_radios.dart';

class FormColumn extends StatefulWidget {
  const FormColumn({Key? key}) : super(key: key);

  @override
  State<FormColumn> createState() => _FormColumnState();
}

class _FormColumnState extends State<FormColumn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: defaultPadding,
            child: NameField(),
          ),
          const Padding(
            padding: defaultPadding,
            child: IdField(),
          ),
          const Padding(
            padding: defaultPadding,
            child: DateField(),
          ),
          const Expanded(
            child: Padding(
              padding: defaultPadding,
              child: DeckField(),
            ),
          ),
          Padding(
            padding: defaultPadding,
            child: Row(
              children: const [
                Text("Paper size"),
                Expanded(
                  child: A4Radio(),
                ),
                Expanded(
                  child: LetterRadio(),
                ),
              ],
            ),
          ),
          const Padding(
            padding: defaultPadding,
            child: OpenInExplorer(),
          ),
          Row(
            children: [
              Padding(
                padding: defaultPadding,
                child: SaveButton(formKey: _formKey)
              ),
              const Padding(
                padding: defaultPadding,
                child: AboutButton(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
