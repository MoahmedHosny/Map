import '../../style/color/color.dart';
import 'package:flutter/material.dart';

Widget buildTextButton(
  context, {
  @required VoidCallback onPressed,
  @required String text,
  double width = 120,
}) {
  return Align(
    alignment: Alignment.centerRight,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: white,
          letterSpacing: 1.5,
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, 50),
        primary: black,
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}
