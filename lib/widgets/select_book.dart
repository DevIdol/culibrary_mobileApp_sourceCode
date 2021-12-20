import 'package:culibrary/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../color_themes.dart';

selectBook(tap, img, name, _iconColor) {
  return InkWell(
    onTap: tap,
    child: Column(
      children: [
        Consumer(builder: (context, ThemeModel themeNotifier, child) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.36,
            height: MediaQuery.of(context).size.height * 0.22,
            child: Card(
              color: themeNotifier.isDark ? darkCardColor : lightCardColor,
              elevation: 20,
              shadowColor:
                  themeNotifier.isDark ? darkShawdowColor : lightShawdowColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: secondColor, width: 5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                img,
              ),
            ),
          );
        }),
        const SizedBox(
          height: 6,
        ),
        Text(
          name,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: _iconColor,
              fontFamily: 'Lora'),
        )
      ],
    ),
  );
}
