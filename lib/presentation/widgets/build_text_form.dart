import '../../style/color/color.dart';
import 'package:flutter/material.dart';

Widget buildTextForm({
  @required String labelText,
  @required TextEditingController controller,
  @required TextInputType type,
  @required IconData prefixIcon,
  @required Function onSaved,
  @required Function validator,
}) =>
    TextFormField(
      controller: controller,
      cursorColor: black,
      style: TextStyle(height: 1),
      keyboardType: type,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon, color: blue.withOpacity(0.6)),
      ),
      onSaved: onSaved,
      validator: validator,
    );
