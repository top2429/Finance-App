import 'package:flutter/material.dart';

import 'constants.dart';

ColorScheme lightThemeColors(context) {
  return const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF202020),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Colors.grey,
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFF32424),
    onError: Color(0xFFF32424),
    background: Color(0xFFFFFFFF),
    onBackground: Color(0xFF4D4C4C),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF4D4C4C),
  );
}

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    primaryColor: const Color(0xFF202020),
    primaryColorLight: const Color(0xFFFFFFFF),
    disabledColor: const Color(0xfff4d4c4c),
    useMaterial3: true,
    dialogBackgroundColor:const Color(0xFFECEAEA),
    cardColor: const Color(0xFFFFFFFF),
    fontFamily: Constants.appFontlight.fontFamily,
    scaffoldBackgroundColor: lightThemeColors(context).background,
    textTheme: textThemelight(context),
    appBarTheme: appBarThemelight(context),
    colorScheme: lightThemeColors(context),
    iconTheme: const IconThemeData(color: Color(0xFF202020)),
  );
}

TextTheme textThemelight(context) {
  return TextTheme(
    bodyLarge: Constants.appFontlight
        .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
    bodyMedium: Constants.appFontlight
        .copyWith(fontWeight: FontWeight.normal, fontSize: 15),
    bodySmall: Constants.appFontlight.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 13,
        color: const Color(0xFF2983FF)),
    labelLarge: Constants.appFontlight.copyWith(
        fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
    labelMedium: Constants.appFontlight.copyWith(
        fontWeight: FontWeight.normal, fontSize: 13, color: Colors.white),
    labelSmall: Constants.appFontlight.copyWith(
        fontWeight: FontWeight.normal, fontSize: 13, color: const Color(0xFF4D4C4C)),
    displaySmall: Constants.appFontdark.copyWith(
        fontWeight: FontWeight.normal, fontSize: 14, color: const Color(0xFF4D4C4C)),
  );
}

appBarThemelight(context) {
  return AppBarTheme(
    backgroundColor: lightThemeColors(context).background,
    titleTextStyle: textThemelight(context).bodyLarge,
  );
}
