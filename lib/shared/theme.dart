import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0xFFffffff);
Color secondaryColor = const Color(0xFFf2f1f4);
Color thirdtyColor = const Color(0xFF0284c7);

Color activeColor = const Color(0xFF84cc16);
Color inactiveColor = const Color(0xFF4d7c0f);
Color compareColor = const Color(0xfff97316);
Color whiteColor = const Color(0xFFffffff);
Color blackColor = const Color(0xFF261932);

const double defaultSpace = 15;

// Define font weights
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extrabold = FontWeight.w800;

// Apply font weights to your text styles
TextStyle whiteTextStyle = GoogleFonts.urbanist(
  color: whiteColor,
  fontWeight: regular, // Add this line
);

TextStyle blackTextStyle = GoogleFonts.urbanist(
  color: blackColor,
  fontWeight: regular, // Add this line
);

TextStyle textPrimaryStyle = GoogleFonts.urbanist(
  color: primaryColor,
  fontWeight: regular, // Add this line
);

TextStyle textSecondaryStyle = GoogleFonts.urbanist(
  color: secondaryColor,
  fontWeight: regular, // Add this line
);

TextStyle textActiveColor = GoogleFonts.urbanist(
  color: activeColor,
  fontWeight: regular, // Add this line
);
