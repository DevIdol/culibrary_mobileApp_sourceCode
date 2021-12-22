import 'package:flutter/material.dart';

import '../color_themes.dart';

noData(text1, text2) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [isEmpty(text1, 18), isEmpty(text2, 13)],
  );
}

isEmpty(text, double size) {
  return Text(
    text,
    style: TextStyle(fontSize: size, color: secondColor, fontFamily: 'Lora'),
  );
}

noDatas(context, _themeMode, _iconColor, {text= "No Data"}) {
  var snackBar = SnackBar(
    backgroundColor: _themeMode,
    duration: const Duration(milliseconds: 500),
    content: Text(
      text,
      style: TextStyle(
          color: _iconColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
          fontFamily: 'Lora'),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
