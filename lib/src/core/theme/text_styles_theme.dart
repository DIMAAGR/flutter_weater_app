import 'package:flutter/material.dart';
import 'package:flutter_weater_app/src/core/theme/theme_data.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeTextStylesThemeData {
  TextStyle loading = GoogleFonts.montserrat(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12);
  TextStyle temperature = TextStyle(color: AppTheme.colors.textColorBlack, fontSize: 68, fontWeight: FontWeight.w600);
  TextStyle description = const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400);
  TextStyle descritpionSubtitle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
  TextStyle nextDays = TextStyle(color: AppTheme.colors.textColorBlack, fontSize: 17);
  TextStyle week = TextStyle(color: AppTheme.colors.textColorBlack, fontSize: 13);
}
