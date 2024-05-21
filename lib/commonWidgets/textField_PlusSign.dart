// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TextFieldWidgetArrowDown extends StatefulWidget {
  final TextEditingController controller;
  final Color textcolor;
  final Color borderSideColor;
  final String label;
  final Color labelColor;
  final TextInputType keyBoardType;
  final Color backgroundColor;
  final VoidCallback onTap;

  const TextFieldWidgetArrowDown({
    super.key,
    required this.controller,
    required this.onTap,
    this.textcolor = Colors.black,
    this.borderSideColor = Colors.black,
    required this.label,
    this.labelColor = Colors.black,
    this.keyBoardType = TextInputType.name,
    this.backgroundColor = const Color.fromARGB(255, 240, 240, 240),
  });

  @override
  State<TextFieldWidgetArrowDown> createState() =>
      _TextFieldWidgetArrowDownState();
}

class _TextFieldWidgetArrowDownState extends State<TextFieldWidgetArrowDown> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      readOnly: true,
      onFieldSubmitted: (value) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
      style: TextStyle(color: widget.textcolor, fontSize: 17),
      controller: widget.controller,
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.add),
          filled: true,
          fillColor: widget.backgroundColor,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: widget.borderSideColor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: widget.borderSideColor)),
          label: Text(widget.label),
          labelStyle: TextStyle(color: widget.labelColor)),
      keyboardType: TextInputType.name,
    );
  }
}
