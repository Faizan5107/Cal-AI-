import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget {
  /// Heading style (e.g. Choose your Gender)
  static Widget heading(
      String text, {
        TextAlign align = TextAlign.start,
        double? fontSize,
        Color? color,
      }) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.interTight(
        fontSize: fontSize ?? 24,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      ),
    );
  }

  /// Subtitle style (e.g. Choose the gender your physiology best aligns with.)
  static Widget subtitle(
      String text, {
        TextAlign align = TextAlign.start,
        double? fontSize,
        Color? color,
      }) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.inter(
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.w400,
        color: color ?? const Color(0xFF666666),
      ),
    );
  }

  /// Normal text style (e.g. Button labels, option text)
  static Widget normal(
      String text, {
        TextAlign align = TextAlign.center,
        double? fontSize,
        Color? color,
      }) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.inter(
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      ),
    );
  }
}
