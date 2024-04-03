import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Colours {
  Colours._();
  static const blueColor = Colors.blue;
}

TextStyle appStyle(
  double size,
  Color color,
  FontWeight fw,
) {
  return GoogleFonts.poppins(
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}
