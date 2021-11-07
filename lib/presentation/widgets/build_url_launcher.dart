import '../../style/color/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void buildUrl(String url) async {
  await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}

Widget buildIcons(IconData icon, String url) {
  return GestureDetector(
    onTap: () => buildUrl(url),
    child: Container(
      child: Icon(
        icon,
        color: blue,
        size: 35,
      ),
    ),
  );
}

Widget buildSocialMediaIcons() {
  return Padding(
    padding: EdgeInsetsDirectional.only(start: 15),
    child: Row(
      children: [
        buildIcons(FontAwesomeIcons.facebook, 'https://www.facebook.com'),
        SizedBox(width: 15),
        buildIcons(FontAwesomeIcons.telegram, 'https://t.me/'),
        SizedBox(width: 15),
        buildIcons(FontAwesomeIcons.youtube, 'https://www.youtube.com/'),
      ],
    ),
  );
}
