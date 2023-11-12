import 'package:castform/constants.dart';
import 'package:castform/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DateField extends StatefulWidget {
  const DateField({super.key});

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  final _dateController =
      TextEditingController(); // Overriding for custom date handling

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: _dateController,
      decoration: const InputDecoration(
        labelText: "Date of Birth (Optional)",
      ),
      onTap: () async {
        // valid date from now to 125 years ago
        await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(maximumHumanLifespan),
          lastDate: DateTime.now(),
        ).then((DateTime? value) {
          if (value != null) {
            // Fill the field if input is valid
            _dateController.text = "${value.month}/${value.day}/${value.year}";
          } else {
            // Clear the field, if "cancel" is clicked
            _dateController.text = "";
          }
          context.read<UserProvider>().setDate(_dateController.text);
        });
      },
      onSaved: (_) =>
          context.read<UserProvider>().setDate(_dateController.text),
    );
  }
}
