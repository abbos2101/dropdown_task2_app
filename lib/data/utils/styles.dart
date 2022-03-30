import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class MyStyles {
  static TextStyle sans() => GoogleFonts.openSans(
        color: MyColors.dark,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
}
