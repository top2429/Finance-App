import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BarIcon extends StatefulWidget {
  final String name;
  final bool active;
  const BarIcon({super.key, required this.name, required this.active});

  @override
  State<BarIcon> createState() => _BarIconState();
}

class _BarIconState extends State<BarIcon> {
  @override
  Widget build(BuildContext context) {
    switch (widget.name) {
      case 'Home':
        return SvgPicture.asset(
          'assets/images/home.svg',
          height: 25,
          width: 25,
          color: widget.active
              ? Colors.black
              : Color(0xFFA9A8AA),
        );

      case 'Analytics':
        return SvgPicture.asset(
          'assets/images/analytics.svg',
          height: 23,
          width: 23,
          color: widget.active
              ? Colors.black
              : Color(0xFFA9A8AA),
        );

      case 'Budget':
        return SvgPicture.asset(
          'assets/images/budget.svg',
          height: 23,
          width: 23,
          color: widget.active
              ? Colors.black
              : Color(0xFFA9A8AA),
        );

      case 'History':
        return SvgPicture.asset(
          'assets/images/history.svg',
          height: 25,
          width: 25,
          color: widget.active
              ? Colors.black
              : Color(0xFFA9A8AA),
        );
      case 'Chat':
        return SvgPicture.asset(
          'assets/images/chat.svg',
          height: 25,
          width: 25,
          color: widget.active
              ? Colors.black
              : Color(0xFFA9A8AA),
        );
    }

    return const Scaffold();
  }
}
