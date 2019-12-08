import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle titleStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 22,
    );
  }

  static TextStyle title01Style() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 17,
      color: Colors.grey[850],
    );
  }

  static TextStyle buttonStyle(Color color) {
    return TextStyle(
      fontFamily: 'Poppins',
      color: color,
      fontSize: 15,
    );
  }

  static TextStyle locationStyle(Color color) {
    return TextStyle(
      fontFamily: 'Poppins',
      color: color,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle regularStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 11,
      color: Colors.grey[600],
    );
  }

  static TextStyle cartTextStyle() {
    return TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 17,
      color: Colors.white,
    );
  }
}
