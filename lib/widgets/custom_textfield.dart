import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, this.maxLines = 1, this.onSaved, this.onChanged});
  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      child: TextFormField(
        onChanged:onChanged,
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field Required !!';
          } else {
            return null;
          }
        },
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          border: buildBorder(),
          focusedBorder: buildBorder(Colors.cyan[500]),
          enabledBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
