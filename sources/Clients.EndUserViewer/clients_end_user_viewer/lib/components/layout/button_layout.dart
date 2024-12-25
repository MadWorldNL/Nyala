import 'package:flutter/material.dart';

class ButtonLayout {
  static ButtonStyle getDefault() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.blue, // Button background color
      foregroundColor: Colors.white, // Text color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      elevation: 5, // Shadow effect
    );
  }
}
