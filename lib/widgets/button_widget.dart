import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

buttonWidget(_iconColor, press, text, _themeMode, themeNotifier) {
  return AnimatedButton(
    color: _iconColor,
    height: 50,
    width: 110,
    onPressed: press,
    child: Text(
      text,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: _themeMode),
    ),
    enabled: true,
    shadowDegree: themeNotifier.isDark ? ShadowDegree.dark : ShadowDegree.light,
  );
}
