import 'package:culibrary/api/text_api.dart';
import 'package:flutter/material.dart';
import '../color_themes.dart';

appBar(_cardColor, _fontColor, title, themeNotifier, _iconColor,
    {tabBar, double? leadingWidth, double? toolbarHeight}) {
  return AppBar(
    shape: RoundedRectangleBorder(
      
      side: BorderSide(color: secondColor, width: 0.9),
      borderRadius: BorderRadius.circular(10),
    ),
    shadowColor: themeNotifier.isDark ? Colors.white24 : Colors.black,
    toolbarHeight: toolbarHeight,
    backgroundColor: _cardColor,
    foregroundColor: _fontColor,
    leadingWidth: leadingWidth,
    automaticallyImplyLeading: false,
    title: Text(
      title,
      style: TextStyle(
          fontFamily: fontStyle,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
          fontSize: 18),
    ),
    elevation: 10,
    actions: [
      InkWell(
        onTap: () {
          themeNotifier.isDark
              ? themeNotifier.isDark = false
              : themeNotifier.isDark = true;
        },
        child: Row(
          children: [
            Text(themeNotifier.isDark ? 'DarkMode' : 'LightMode',
                style: TextStyle(
                    color: _fontColor, fontSize: 12, fontFamily: fontStyle,)),
            SizedBox(width: 2),
            Icon(
              themeNotifier.isDark ? Icons.dark_mode : Icons.light_mode,
              color: _iconColor,
            ),
            const SizedBox(width: 8)
          ],
        ),
      )
    ],
    bottom: tabBar,
  );
}
