import 'package:flutter/material.dart';

// Colors
const Color kPrimaryColor = Color(0xFF61A4BC);
const Color kSecondaryColor = Color(0xFF5B7DB1);
const Color kDarkAccentColor = Color(0xFF1A132F);
const Color kLightAccentColor = Color(0xFFF7E2E2);

// Decorations
final BoxDecoration kCardBoxDecoration = BoxDecoration(
  color: kLightAccentColor,
  borderRadius: BorderRadius.circular(15),
);

final BoxDecoration kTextFieldDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
  border: Border.all(width: 1.5),
);

final BoxDecoration kPrimaryDecoration = BoxDecoration(
  color: kPrimaryColor,
  borderRadius: BorderRadius.circular(10),
);

final BoxDecoration kSecondaryDecoration = BoxDecoration(
  color: kDarkAccentColor,
  borderRadius: BorderRadius.circular(10),
);

// TextStyles
const TextStyle kHeadingTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 25,
  color: Colors.black,
);

const TextStyle kForgotPasswordTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16,
  color: kDarkAccentColor,
  decoration: TextDecoration.underline,
);
