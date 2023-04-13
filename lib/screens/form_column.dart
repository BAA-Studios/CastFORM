import 'package:flutter/material.dart';
import 'package:castform/constants.dart';
import 'package:castform/models/user.dart';

class FormColumn extends StatefulWidget {
  const FormColumn({Key? key}) : super(key: key);

  @override
  State<FormColumn> createState() => _FormColumnState();
}

class _FormColumnState extends State<FormColumn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _user = User();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: defaultPadding,
            child: SizedBox(
              width: 100.0,
              height: 50.0,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Player Name",
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Name is a required field!";
                  }
                  return null;
                },
                onSaved: (String? value) {
                  setState(() => _user.playerName = value);
                },
              ),
            ),
          ),
          Padding(
            padding: defaultPadding,
            child: SizedBox(
              width: 100.0,
              height: 50.0,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Player ID",
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "ID is a required field!";
                  }
                  return null;
                },
                onSaved: (String? value) {
                  setState(() => _user.playerId = value);
                },
              ),
            ),
          ),
          Padding(
            padding: defaultPadding,
            child: SizedBox(
              width: 100.0,
              height: 50.0,
              child: InputDatePickerFormField(
                // Limit to range from 125 years ago to now:
                firstDate: DateTime.now().subtract(const Duration(days: maximumHumanLifespan)),
                lastDate: DateTime.now(),
                fieldLabelText: "Date of Birth",
                onDateSaved: (DateTime? value) {
                  setState(() => _user.dateOfBirth = value);
                },
              ),
            ),
          ),
          Padding(
            padding: defaultPadding,
            child: SizedBox(
              width: 100.0,
              height: 150.0,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Deck String",
                  hintText: "Supports PTCGO, PTCGL, and Limitless formats",
                  border: defaultBorder,
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Deck string is a required field!";
                  }
                  return null;
                },
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
                onSaved: (String? value) {
                  setState(() => _user.deckString = value);
                },
              ),
            ),
          ),
          Padding(
            padding: defaultPadding,
            child: Row(
              children: [
                const Text("Paper size"),
                Expanded(
                  child: RadioListTile<PaperType>(
                    title: const Text("A4"),
                    value: PaperType.a4,
                    groupValue: _user.paperType,
                    onChanged: (PaperType? value) {
                      setState(() => _user.paperType = value);
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<PaperType>(
                    title: const Text("Letter"),
                    value: PaperType.letter,
                    groupValue: _user.paperType,
                    onChanged: (PaperType? value) {
                      setState(() => _user.paperType = value);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(  // Spacer
            height: 200.0,
          ),
          Padding(
            padding: defaultPadding,
            child: ElevatedButton(
              onPressed: () {
                final form = _formKey.currentState;
                if (form!.validate()) {
                  form.save();
                  _user.save();
                }
              },
              child: const Text("Save"),
            ),
          ),
        ],
      ),
    );
  }
}
