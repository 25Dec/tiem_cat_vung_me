import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  final BuildContext context;

  AppTheme(this.context);

  ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.pink,
        background: AppColors.white2,
      ),
      textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
