import 'build_country_flags.dart';
import '../../style/color/color.dart';
import 'package:flutter/material.dart';

String phoneNumber;
TextEditingController numberController = TextEditingController();
Widget buildPhoneTextField() {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: black.withOpacity(0.2), width: 1.2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              buildCountryFlags() + ' +20',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        flex: 3,
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: black.withOpacity(0.4), width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: TextFormField(
            controller: numberController,
            keyboardType: TextInputType.phone,
            // autofocus: true,
            cursorColor: black,
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 1,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            validator: (value) {
              if (value == '' || value.isEmpty || value == null) {
                return 'Please enter the phone number!!';
              } else if (value.length < 11) {
                return 'Too short for a phone number!!';
              }
              return null;
            },
            onSaved: (value) {
              phoneNumber = value;
            },
          ),
        ),
      ),
    ],
  );
}
