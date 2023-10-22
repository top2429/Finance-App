import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final Color textcolor;
  final Color borderSideColor;
  final String label;
  final Color labelColor;
  final TextInputType keyBoardType;
  final Color backgroundColor;
    final void Function(String) onChanged;

  TextFieldWidget(
      {super.key,
      required this.controller,
      this.textcolor = Colors.white,
      this.borderSideColor = Colors.black,
      required this.label,
      this.labelColor = Colors.black,
      this.keyBoardType = TextInputType.name,
      this.backgroundColor = Colors.white,
            required this.onChanged
});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        // this will  handle the checks when the field is submitted 
        // but before the button to proceed is pressed
      },

      // this is used for search functionality where it returns 
        // some of the results depending on the values that are 
        // already in the field
      onChanged: widget.onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '';
        }
        return null;
      },
      style: TextStyle(color: widget.textcolor, fontSize: 17),
      controller: widget.controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 15, bottom: 15, left: 13),
          filled: true,
          fillColor: widget.backgroundColor,
          // errorText:
          //     widget.controllerExist.isEmpty ? null : widget.controllerExist,
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
