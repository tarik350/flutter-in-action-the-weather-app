import 'package:flutter/material.dart';

class TextFormFieldMaker extends StatelessWidget {
  final String helpertext;
  final labletext;

  TextFormFieldMaker({this.helpertext, this.labletext});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: FocusNode(),
      onSaved: (String val) => print(val),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        helperText: this.helpertext,
        helperStyle: TextStyle(color: Colors.amber[900]),
        labelText: this.labletext,
      ),
      validator: (String val) {
        if (val.isEmpty) {
          return "Field cannot be left blank";
        }
        return null;
      },
    );
  }
}
