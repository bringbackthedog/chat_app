import 'package:flutter/material.dart';

/// Chat App Theme
///
/// [TextTheme class](https://api.flutter.dev/flutter/material/TextTheme-class.html)
ThemeData chatAppTheme = ThemeData(
  scaffoldBackgroundColor: Colors.amber,
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 48,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    headline4: TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),

    /// Default body text is `bodyText2`
    bodyText2: TextStyle(fontSize: 18, color: Colors.white),
    button: TextStyle(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
    caption: TextStyle(fontSize: 12, color: Colors.white),
  ),
);
