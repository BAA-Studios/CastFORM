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
          SizedBox(
            width: 100.0,
            height: 50.0,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Player Name",
              ),
            ),
          ),
          SizedBox(
            width: 100.0,
            height: 50.0,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Player ID",
              ),
            ),
          ),
          SizedBox(
            width: 100.0,
            height: 50.0,
            child: InputDatePickerFormField(
              // Limit to range from 125 years ago to now:
              firstDate: DateTime.now().subtract(const Duration(days: 45625)),
              lastDate: DateTime.now(),
              fieldLabelText: "Date of Birth",
            ),
          ),
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Deck String",
                hintText: "Supports PTCGO, PTCGL, and Limitless formats",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              maxLines: null,
              expands: true,
              keyboardType: TextInputType.multiline,
            ),
          ),
          Row(
            children: [
              const Text("Paper size"),
              Expanded(
                child: RadioListTile<PaperType>(
                  title: const Text("A4"),
                  value: PaperType.a4,
                  groupValue: _user.paperType,
                  onChanged: (PaperType? value) {
                    setState(() {
                      _user.paperType = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<PaperType>(
                  title: const Text("Letter"),
                  value: PaperType.letter,
                  groupValue: _user.paperType,
                  onChanged: (PaperType? value) {
                    setState(() {
                      _user.paperType = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
