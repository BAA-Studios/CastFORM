import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:castform/constants.dart';
import 'package:castform/providers/user_provider.dart';

class FormColumn extends StatefulWidget {
  const FormColumn({Key? key}) : super(key: key);

  @override
  State<FormColumn> createState() => _FormColumnState();
}

class _FormColumnState extends State<FormColumn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TODO: Refactor out field (and their states) to individual modules
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _dateController = TextEditingController();  // Overriding for custom date handling
  final _deckController = TextEditingController();

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
            child: Focus(
              child: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Player Name",
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Name is a required field!";
                  }
                  return null;
                },
                onSaved: (_) => context.read<UserProvider>().setName(_nameController.text),
              ),
              onFocusChange: (_) => context.read<UserProvider>().setName(_nameController.text),
            ),
          ),
          Padding(
            padding: defaultPadding,
            child: Focus(
              child: TextFormField(
                controller: _idController,
                decoration: const InputDecoration(
                  labelText: "Player ID (Optional)",
                ),
                onSaved: (_) => context.read<UserProvider>().setId(_nameController.text),
              ),
              onFocusChange: (_) => context.read<UserProvider>().setId(_nameController.text),
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
                  context.read<UserProvider>().setDate(_dateController.text);
                });
              },
              onSaved: (_) => context.read<UserProvider>().setDate(_dateController.text),
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
                onChanged: (_) => context.read<UserProvider>().setDeckString(_deckController.text),
                onSaved: (_) => context.read<UserProvider>().setDeckString(_deckController.text),
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
                    groupValue: context.select<UserProvider, PaperType?>((userProvider) => userProvider.paperType),
                    onChanged: (PaperType? value) => context.read<UserProvider>().setPaperType(value),
                  ),
                ),
                Expanded(
                  child: RadioListTile<PaperType>(
                    title: const Text("Letter"),
                    value: PaperType.letter,
                    groupValue: context.select<UserProvider, PaperType?>((userProvider) => userProvider.paperType),
                    onChanged: (PaperType? value) => context.read<UserProvider>().setPaperType(value),
                  ),
                ),
              ],
            ),
          ),
          // TODO: Add switch for open folder after export
          Padding(
            padding: defaultPadding,
            child: ElevatedButton(
              onPressed: () {
                final form = _formKey.currentState;
                if (form!.validate()) {
                  form.save();
                  context.read<UserProvider>().save();
                }
              },
              child: const Text("Save"),
            ),
          ),
          // TODO: Add 'clear deck list' button
          // TODO: Add 'about' button
        ],
      ),
    );
  }
}
