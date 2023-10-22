import 'package:flutter/material.dart';

class TextFieldWidgetIcon extends StatefulWidget {
  final bool enabled;
  final bool hasICon;
  final TextEditingController controller;
  final Color textcolor;
  final Color borderSideColor;
  final String label;
  final Color labelColor;
  final TextInputType keyBoardType;
  final Color backgroundColor;
  final void Function(String) onChanged;
  TextFieldWidgetIcon(
      {super.key,
      required this.controller,
      this.textcolor = Colors.black,
      this.borderSideColor = Colors.grey,
      required this.label,
      this.labelColor = Colors.grey,
      this.keyBoardType = TextInputType.name,
      this.backgroundColor = Colors.white,
      required this.hasICon,
      required this.enabled,
      required this.onChanged
      });

  @override
  State<TextFieldWidgetIcon> createState() => _TextFieldWidgetIconState();
}

class _TextFieldWidgetIconState extends State<TextFieldWidgetIcon> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      style: TextStyle(color: widget.textcolor, fontSize: 17),
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: widget.hasICon? Icon(Icons.edit, color: Colors.black,size: 19,) :null,
          contentPadding: EdgeInsets.only(top: 15, bottom: 15, left: 0),
          filled: true,
          fillColor: widget.backgroundColor,
          // errorText:
          //     widget.controllerExist.isEmpty ? null : widget.controllerExist,
          // focusedBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: widget.borderSideColor)),
          // border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(10),
          //     borderSide: BorderSide(color: widget.borderSideColor)),
          label: Text(widget.label),
          labelStyle: TextStyle(color: widget.labelColor)
          //hintText: 'username',

          ),
      keyboardType: TextInputType.name,

      //  keyboardType: TextInputType.name,
    );
  }
}
