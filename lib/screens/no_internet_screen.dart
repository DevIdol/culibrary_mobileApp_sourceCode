import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:culibrary/api/text_api.dart';
import 'package:culibrary/color_themes.dart';
import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off,
                  color: secondColor,
                  size: 120,
                ),
                SizedBox(height: 30),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('No Internet Connection',
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: fontStyle,
                            letterSpacing: 1),
                        speed: const Duration(milliseconds: 60))
                  ],
                  isRepeatingAnimation: false,
                  repeatForever: false,
                  displayFullTextOnTap: true,
                ),
              ],
            )),
        Positioned(
            bottom: 60.0,
            child: Text(
              'Developed by DevIdol',
              style: TextStyle(fontSize: 10, color: secondColor),
            ))
      ],
    );
  }
}
