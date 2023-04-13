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
      child: Container(),
    );
  }
}
