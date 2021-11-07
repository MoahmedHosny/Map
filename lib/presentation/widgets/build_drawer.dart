import 'build_divider.dart';
import 'build_header_drawer.dart';
import 'build_url_launcher.dart';
import '../../style/color/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'build_drawer_list_item.dart';
import 'build_logout.dart';

Widget buildDrawer(context) {
  return Drawer(
    // ListView,
    // padding: EdgeInsets.zero,
    child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.265,
          child: DrawerHeader(
            padding: EdgeInsets.only(top: 25),
            decoration: BoxDecoration(color: lightBlue),
            child: buildHeaderDrawer(context),
          ),
        ),

        buildDrawerListItem(
            leading: Icons.person_rounded, text: 'My Profile', onTap: () {}),
        buildDivider(),
        buildDrawerListItem(
            leading: Icons.history_rounded, text: 'Saved Places', onTap: () {}),
        buildDivider(),
        buildDrawerListItem(
            leading: Icons.settings, text: 'Settings', onTap: () {}),
        buildDivider(),
        buildDrawerListItem(leading: Icons.help, text: 'Help', onTap: () {}),
        buildDivider(),
        buildDrawerListItem(
            leading: Icons.language, text: 'Language', onTap: () {}),
        buildDivider(),
        buildLogoutWithBloc(context),
        // SizedBox(height: MediaQuery.of(context).size.height * 0.25),
        Spacer(),
        ListTile(
          leading: Text(
            'Follow Us',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.2),
          ),
        ),
        buildSocialMediaIcons(),
        SizedBox(height: 10),
      ],
    ),
  );
}
