import 'package:culibrary/api/text_api.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../color_themes.dart';

chooseButton(press, double height, double width, img, name, double toLeft,
    double toRight, double bottomLeft, double bottomRight) {
  return Consumer(builder: (context, ThemeModel themeNotifier, child) {
    return InkWell(
      onTap: press,
      child: SizedBox(
        height: height,
        width: width,
        child: Card(
          color: themeNotifier.isDark ? darkCardColor : lightCardColor,
          elevation: 4,
          shadowColor: themeNotifier.isDark ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: secondColor, width: 0.4),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(toLeft),
                  topRight: Radius.circular(toRight),
                  bottomLeft: Radius.circular(bottomLeft),
                  bottomRight: Radius.circular(bottomRight))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              img,
              const SizedBox(height: 12),
              Text(
                name,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: fontStyle,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              )
            ],
          ),
        ),
      ),
    );
  });
}
