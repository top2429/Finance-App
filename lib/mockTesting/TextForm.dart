import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final TextEditingController controller;
  final String controllerExist;
  final Color textcolor;
  final Color borderSideColor;
  final String label;
  final Color labelColor;
  final TextInputType keyBoardType;
  final Color backgroundColor;
  const TextForm(
      {super.key,
      required this.controller,
      required this.controllerExist,
      this.textcolor = Colors.white,
      this.borderSideColor = Colors.black,
      required this.label,
      this.labelColor = Colors.black,
      this.keyBoardType = TextInputType.name,
      this.backgroundColor = Colors.white,
      });

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      style: TextStyle(color: widget.textcolor, fontSize: 17),
      controller: widget.controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 15, bottom: 15, left: 13),
          filled: true,
          fillColor: widget.backgroundColor,
          errorText: widget.controllerExist.isEmpty
              ? null
              : widget.controllerExist,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderSideColor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: widget.borderSideColor)),
          label: Text(widget.label),
          labelStyle: TextStyle(color: widget.labelColor)
          //hintText: 'username',

          ),
      keyboardType: TextInputType.name,

      //  keyboardType: TextInputType.name,
    );
  }
}
