import '../../component/constants/constants.dart';
import '../../style/color/color.dart';
import '../../style/icon/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

Widget buildFloatingSearchBar(context) {
  /// import (isPortrait)
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  return FloatingSearchBar(
    /// import (Controller)
    controller: controller,
    elevation: 6,
    hint: 'Find a place...',
    hintStyle: TextStyle(
        fontSize: 16, color: black.withOpacity(0.4), letterSpacing: 2),
    queryStyle: TextStyle(fontSize: 16),
    border: BorderSide.none,
    margins: EdgeInsetsDirectional.fromSTEB(20, 60, 20, 0),
    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 12, 0),
    height: 45,
    iconColor: blue,
    scrollPadding: const EdgeInsets.only(top: 18, bottom: 50),
    transitionDuration: const Duration(milliseconds: 600),
    transitionCurve: Curves.easeInOut,
    debounceDelay: const Duration(milliseconds: 500),
    physics: BouncingScrollPhysics(),
    openAxisAlignment: 0,
    axisAlignment: isPortrait ? 0 : -1,
    width: isPortrait ? 500 : 600,
    transition: CircularFloatingSearchBarTransition(),
    actions: [
      FloatingSearchBarAction(
        showIfOpened: false,
        child: Icon(
          IconBroken.Location,
          color: blue,
        ),
      ),
    ],
    onQueryChanged: (query) {},
    onFocusChanged: (_) {},
    builder: (context, transition) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [],
        ),
      );
    },
  );
}
