import 'package:flutter/material.dart';

Widget buildIntroText({
  @required String headerText,
  @required String subText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        headerText,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 30),
      Container(
        child: Text(
          subText,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ),
    ],
  );
}
