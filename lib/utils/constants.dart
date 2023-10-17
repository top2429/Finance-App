import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  Constants._();

  static TextStyle appFontlight =
      TextStyle(fontFamily: 'Ubuntu', color: Color.fromARGB(255, 0, 0, 0));
  static TextStyle appFontdark =
      GoogleFonts.roboto().copyWith(color: const Color(0xFFFFFFFF));

  static Color navBarIconColorlight = const Color.fromARGB(255, 107, 99, 99);
  static Color navBarIconColordark = const Color.fromARGB(255, 255, 255, 255);
  static Color fillColorForTextFieldOnDarkBackground =
      const Color.fromARGB(255, 80, 80, 80);
  static Color butonColorOnDarkbackground =
      const Color.fromARGB(255, 7, 14, 39);

  static Color callToActionBLue = const Color(0xFF466AE7);

  static Color inactiveNavBarIconColor = Color(0xFFA9A8AA);
}
