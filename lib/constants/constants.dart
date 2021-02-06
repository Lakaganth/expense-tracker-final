import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//BG Colors

const BoxDecoration kSplashScreenBG = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(63, 19, 157, 1), Color.fromRGBO(105, 19, 157, .52)],
  ),
);

const BoxDecoration kLoginScreenBG = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(252, 76, 76, 1), Color.fromRGBO(240, 220, 43, .87)],
  ),
);
const BoxDecoration kRegisterScreenBG = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(164, 252, 76, 1), Color.fromRGBO(43, 240, 98, .60)],
  ),
);

const kShadowColor = Color.fromRGBO(0, 0, 0, 0.15);
const kSidebarBackgroundColor = Color(0xFF040404);
const kPrimaryLabelColor = Color(0xFF242629);
const kBackgroundColor = Color(0xFFE7EEFB);

var kCalloutLabelStyle = GoogleFonts.roboto(
  fontSize: 16.0,
  fontWeight: FontWeight.w800,
  decoration: TextDecoration.none,
  color: Colors.white,
);

var kLargeHeading = GoogleFonts.roboto(
  fontSize: 28.0,
  fontWeight: FontWeight.w800,
);

var kNewTripFormLabelGreen = GoogleFonts.quicksand(
  fontSize: 20.0,
  color: Color(0XFFA6E28A),
  fontWeight: FontWeight.bold,
);
