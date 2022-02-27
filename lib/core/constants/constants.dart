import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const red = Colors.red;
const white = Colors.white;
const orange = Colors.orange;
const grey = Colors.grey;
const bGrey = Colors.blueGrey;
const black = Colors.black;
const transparent = Colors.transparent;

const ocean = Color.fromRGBO(0, 157, 196, 0.75);
const lightB = Color.fromRGBO(25, 182, 221, 0.95);
const dBlue = Color(0xFF0047AB);
const green = Color(0xFF32CD32);

const TextTheme bigScreen = TextTheme(
  headline1: TextStyle(
    letterSpacing: 0.5,
    fontSize: 26.0,
    color: white,
    fontFamily: "Transformers",
    fontWeight: FontWeight.bold,
  ),
  headline2: TextStyle(
    letterSpacing: 0.5,
    fontSize: 22.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.bold,
  ),
  headline3: TextStyle(
    letterSpacing: 0.5,
    fontSize: 20.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.bold,
  ),
  headline4: TextStyle(
    letterSpacing: 0.5,
    fontSize: 16.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.bold,
  ),
  headline5: TextStyle(
    letterSpacing: 0.5,
    fontSize: 14.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.bold,
  ),
  headline6: TextStyle(
    letterSpacing: 0.5,
    fontSize: 12.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.bold,
  ),
  bodyText1: TextStyle(
    letterSpacing: 0.5,
    fontSize: 14.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.w600,
  ),
  bodyText2: TextStyle(
    letterSpacing: 0.5,
    fontSize: 14.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.w600,
  ),
  subtitle1: TextStyle(
    letterSpacing: 0.5,
    fontSize: 12.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.bold,
  ),
  subtitle2: TextStyle(
    letterSpacing: 0.5,
    fontSize: 12.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.bold,
  ),
);

const TextTheme smallScreen = TextTheme(
  headline1: TextStyle(
    letterSpacing: 0.5,
    fontSize: 22.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.bold,
  ),
  headline2: TextStyle(
    letterSpacing: 0.5,
    fontSize: 20.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.bold,
  ),
  headline3: TextStyle(
    letterSpacing: 0.5,
    fontSize: 18.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.bold,
  ),
  headline4: TextStyle(
    letterSpacing: 0.5,
    fontSize: 14.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.bold,
  ),
  headline5: TextStyle(
    letterSpacing: 0.5,
    fontSize: 12.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.bold,
  ),
  headline6: TextStyle(
    letterSpacing: 0.5,
    fontSize: 10.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.bold,
  ),
  bodyText1: TextStyle(
    letterSpacing: 0.5,
    fontSize: 12.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.w600,
  ),
  bodyText2: TextStyle(
    letterSpacing: 0.5,
    fontSize: 12.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.w600,
  ),
  subtitle1: TextStyle(
    letterSpacing: 0.5,
    fontSize: 10.0,
    color: white,
    fontFamily: "FiraCode",
    fontWeight: FontWeight.bold,
  ),
  subtitle2: TextStyle(
    letterSpacing: 0.5,
    fontSize: 10.0,
    color: white,
    fontFamily: "FiraCode-Bold",
    fontWeight: FontWeight.bold,
  ),
);

AppBar appBarComponent(Color color, Widget leading, String title, Icon icon,
    Function function, String actionText) {
  return AppBar(
    backgroundColor: color,
    leading: leading,
    automaticallyImplyLeading: false,
    title: Text(
      title,
      style: GoogleFonts.lato(
        textStyle: const TextStyle(
          fontSize: 20,
          letterSpacing: 1.25,
          color: white,
        ),
      ),
    ),
    actions: <Widget>[
      TextButton.icon(
        icon: icon,
        label: Text(
          actionText,
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 18,
              letterSpacing: .75,
              color: white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        onPressed: function,
      ),
    ],
  );
}
