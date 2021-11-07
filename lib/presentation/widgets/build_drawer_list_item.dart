import '../../style/color/color.dart';
import '../../style/icon/icon_broken.dart';
import 'package:flutter/material.dart';

Widget buildDrawerListItem({
  @required IconData leading,
  @required String text,
  Widget trailing,
  Function onTap,
  Color color,
}) {
  return ListTile(
    leading: Icon(
      leading,
      color: color ?? blue,
    ),
    title: Text(
      text,
      style: TextStyle(
        fontSize: 16.85,
      ),
    ),
    trailing: trailing ??
        Icon(
          IconBroken.Arrow___Right_2,
          size: 20,
          color: blue,
        ),
    onTap: onTap,
  );
}
