import 'package:culibrary/api/text_api.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../color_themes.dart';

chooseButton(press, double height, double width, img, name, double topLeft,
    double topRight, double bottomLeft, double bottomRight) {
  return Consumer(builder: (context, ThemeModel themeNotifier, child) {
    return InkWell(
      onTap: press,
      child: SizedBox(
        height: height,
        width: width,
        child: Container(
          decoration: BoxDecoration(
            color: themeNotifier.isDark ? darkCardColor : lightCardColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeft),
                topRight: Radius.circular(topRight),
                bottomLeft: Radius.circular(bottomLeft),
                bottomRight: Radius.circular(bottomRight)),
            border: Border.all(color: secondColor, width: 0.99),
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.inner,
                blurRadius: 100,
                color: secondColor,
                offset: Offset(
                  0,
                  4,
                ),
              )
            ],
          ),
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
