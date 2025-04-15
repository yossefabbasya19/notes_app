import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.maxLine = 1,
    required this.hintText,
    required this.onSave,
    this.initialValue
  });

  final String? initialValue;
  final String hintText;
  final int maxLine;
  final void Function(String?)? onSave;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onSaved: onSave,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "plz enter value";
        }
        return null;
      },
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
