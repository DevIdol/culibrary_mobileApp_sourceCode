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
    style: TextStyle(fontSize: size, color: secondColor),
  );
}
