import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  final String text;
  final VoidCallback onpressed;
  final bool disabled;
  final bool lightBlue;
  const MainButton(
      {super.key,
      required this.text,
      required this.onpressed,
      this.disabled = false,
      this.lightBlue = false
      });

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: widget.onpressed,
      child: Material(
        borderRadius: BorderRadius.circular(30),
        elevation: 0,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: widget.disabled ? theme.disabledColor : widget.lightBlue?Color(0x4B5EFC): theme.primaryColor),
            width: 343,     
            height: 45,
            child: Center(
                child: Text(
              widget.text,
              style: theme.textTheme.labelLarge,
            ))),
      ),
    );
  }
}
