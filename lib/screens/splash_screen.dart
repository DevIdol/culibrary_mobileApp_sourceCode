import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:culibrary/color_themes.dart';
import 'package:culibrary/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 800))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacement(PageTransition(
              child: const HomePage(), type: PageTransitionType.topToBottom));
          Timer(const Duration(milliseconds: 100), () {
            setState(() {
              _animationController.reset();
            });
          });
        }
      });
    Timer(const Duration(milliseconds: 1400), () {
      setState(() {
        _animationController.forward();
      });
    });
  }

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
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/logo.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(height: 20),
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText('CU LIBRARY',
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontFamily: 'Lora'),
                            speed: const Duration(milliseconds: 60))
                      ],
                      isRepeatingAnimation: false,
                      repeatForever: false,
                      displayFullTextOnTap: false,
                    ),
                  ],
                )),
            Positioned(
                bottom: 60.0,
                child: Text(
                  'Developed by DevIdol',
                  style: TextStyle(
                      fontSize: 12, color: secondColor, fontFamily: 'Lora'),
                ))
          ],
        ));
  }
}
