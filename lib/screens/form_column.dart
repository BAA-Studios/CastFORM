import 'package:castform/constants.dart';
import 'package:castform/screens/buttons.dart';
import 'package:castform/screens/date_field.dart';
import 'package:castform/screens/deck_field.dart';
import 'package:castform/screens/division_radios.dart';
import 'package:castform/screens/id_field.dart';
import 'package:castform/screens/name_field.dart';
import 'package:castform/screens/open_file.dart';
import 'package:castform/screens/open_in_explorer.dart';
import 'package:castform/screens/paper_size_radios.dart';
import 'package:flutter/material.dart';

class FormColumn extends StatefulWidget {
  const FormColumn({super.key});

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
          const Padding(
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
            child: Row(
              children: [
                Text("Age Division"),
                SizedBox(
                  width: 25.0,
                ),
                Expanded(
                  child: NoneRadio(),
                ),
                Expanded(
                  child: AutoRadio(),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 16.0, 4.0),
            child: Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 4,
                  child: JuniorRadio(),
                ),
                Expanded(
                  flex: 4,
                  child: SeniorRadio(),
                ),
                Expanded(
                  flex: 4,
                  child: MastersRadio(),
                ),
              ],
            ),
          ),
          const Padding(
            padding: defaultPadding,
            child: Row(
              children: [
                Text("Paper size"),
                SizedBox(
                  width: 42.0,
                ),
                Expanded(
                  child: A4Radio(),
                ),
                Expanded(
                  child: LetterRadio(),
                ),
              ],
            ),
          ),
          const OpenInExplorer(),
          const OpenFileOnSave(),
          Row(
            children: [
              Padding(
                  padding: defaultPadding,
                  child: SaveButton(formKey: _formKey)),
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
