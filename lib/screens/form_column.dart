import 'package:flutter/material.dart';

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Player Name",
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Player ID",
            ),
          ),
          InputDatePickerFormField(
              // Limit to range from 125 years ago to now:
            firstDate: DateTime.now().subtract(const Duration(days: 45625)),
            lastDate: DateTime.now(),
            fieldHintText: "Date of Birth",
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Deck String",
            ),
          ),
        ],
      ),
    );
  }
}
