import 'package:culibrary/api/text_api.dart';
import 'package:flutter/material.dart';

import '../color_themes.dart';

inputAppBar(themeNotifier, _cardColor, _fontColor, text) {
  return AppBar(
    elevation: 20,
    toolbarHeight: 60,
    shadowColor: themeNotifier.isDark ? Colors.white12 : Colors.black54,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: secondColor, width: 0.4),
      borderRadius: BorderRadius.circular(10),
    ),
    centerTitle: true,
    backgroundColor: _cardColor,
    foregroundColor: _fontColor,
    title: Text(
      text,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, fontFamily: fontStyle),
    ),
  );
}
