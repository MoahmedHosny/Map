import '../../style/color/color.dart';
import '../../style/icon/icon_broken.dart';
import 'package:flutter/material.dart';

Widget buildImagePicker({
  @required ImageProvider image,
  @required Function onPressed,
}) =>
    Align(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 66,
            backgroundColor: blue.withOpacity(0.4),
            child: CircleAvatar(
              radius: 64,
              backgroundColor: lightBlue,
              backgroundImage: image,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 4, bottom: 4),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: blue.withOpacity(0.4),
              child: IconButton(
                onPressed: onPressed,
                splashRadius: 20,
                icon: Icon(
                  IconBroken.Camera,
                  color: white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
