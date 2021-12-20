import 'package:culibrary/color_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: firstColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitCircle(color: darkFontColor, size: 50.0),
                  ],
                )),
            Positioned(
                bottom: 60.0,
                child: Text(
                  'Developed by DevIdol',
                  style: TextStyle(fontSize: 12, color: secondColor, fontFamily: 'Lora'),
                ))
          ],
        ));
  }
}
