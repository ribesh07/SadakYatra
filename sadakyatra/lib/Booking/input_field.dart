// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class InputField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? keypad;

  const InputField({
    super.key,
    this.label = "label Name",
    this.icon,
    this.keypad,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType:
            (keypad != null) ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          label: Text(label),
          prefixIcon: Icon(icon),
          hintText: label,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide:
                BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.blue.withOpacity(1), width: 2),
          ),
        ),
      ),
    );
  }
}
