import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  Constants._();

  static TextStyle appFontlight = const TextStyle(
      fontFamily: 'Ubuntu', color: Color.fromARGB(255, 0, 0, 0));
  static TextStyle appFontdark =
      GoogleFonts.roboto().copyWith(color: const Color(0xFFFFFFFF));

  static Color navBarIconColorlight = const Color.fromARGB(255, 107, 99, 99);
  static Color navBarIconColordark = const Color.fromARGB(255, 255, 255, 255);
  static Color fillColorForTextFieldOnDarkBackground =
      const Color.fromARGB(255, 80, 80, 80);
  static Color butonColorOnDarkbackground =
      const Color.fromARGB(255, 7, 14, 39);

  static Color callToActionBLue = const Color(0xFF466AE7);

  static Color inactiveNavBarIconColor = const Color(0xFFA9A8AA);

  static Color bottomNavBarColor = const Color.fromARGB(255, 240, 240, 240);

  static Color homePageBigCardColor = const Color(0xFF262329);
}


/* Navigation code 
[ Navigator.push(
  context,
  MaterialPageRoute(
      builder: (context) =>
          const SavingGoalsScreen())); ] */



// the appbar code

// appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "New Request",
//           style: TextStyle(fontSize: 20),
//         ),
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//             color: Colors.black,
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(Icons.arrow_back)),
//       ),