import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  final String text;
  final VoidCallback onpressed;
  final bool disabled;
  final bool lightBlue;
  final bool red;
  final bool indicator;
  const MainButton(
      {super.key,
      required this.text,
      this.indicator = false,
      required this.onpressed,
      this.disabled = false,
      this.lightBlue = false,
      this.red = false});

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: widget.disabled ? null : widget.onpressed,
      child: Material(
        borderRadius: BorderRadius.circular(30),
        elevation: 0,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: widget.disabled
                    ? Colors.black
                    : widget.lightBlue
                        ? Color.fromARGB(255, 10, 49, 82)
                        : widget.red
                            ? const Color.fromARGB(255, 252, 82, 70)
                            : theme.primaryColor),
            width: 343,
            height: 45,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: widget.indicator
                      ? const CupertinoActivityIndicator(
                          // strokeWidth: 3,
                          color: Colors.white,
                        )
                      : Text(
                          widget.text,
                          style: theme.textTheme.labelLarge,
                        )),
            )),
      ),
    );
  }
}
