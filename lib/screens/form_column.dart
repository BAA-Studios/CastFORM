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
  final _dateController = TextEditingController();  // Overriding for custom date handling
  final _user = User();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: defaultPadding,
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
          Padding(
            padding: defaultPadding,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Player ID (Optional)",
              ),
              onSaved: (String? value) {
                setState(() => _user.playerId = value);
              },
            ),
          ),
          Padding(
            padding: defaultPadding,
            child: TextFormField(
              readOnly: true,
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: "Date of Birth (Optional)",
              ),
              onTap: () async {  // valid date from now to 125 years ago
                await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(maximumHumanLifespan),
                  lastDate: DateTime.now(),
                ).then((DateTime? value) {
                  if (value != null) {  // Fill the field if input is valid
                    _dateController.text = "${value.month}/${value.day}/${value.year}";
                  } else {  // Clear the field, if "cancel" is clicked
                    _dateController.text = "";
                  }
                });
              },
              onSaved: (String? value) {
                setState(() => _user.dateOfBirth = value);
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: defaultPadding,
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
