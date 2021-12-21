import 'package:culibrary/api/url_launcher_api.dart';
import 'package:culibrary/provider/conectivity_provider.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/screens/no_signal.dart';
import 'package:culibrary/widgets/appbar_widget.dart';
import 'package:culibrary/widgets/load_image_firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../color_themes.dart';

class FirstYearBooks extends StatefulWidget {
  const FirstYearBooks({Key? key}) : super(key: key);

  @override
  State<FirstYearBooks> createState() => _FirstYearBooksState();
}

class _FirstYearBooksState extends State<FirstYearBooks> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      final _themeMode = themeNotifier.isDark ? darkMode : lightMode;
      final _cardColor = themeNotifier.isDark ? darkCardColor : lightCardColor;
      final _fontColor = themeNotifier.isDark ? darkFontColor : lightFontColor;
      final _iconColor =
          themeNotifier.isDark ? darkModeIconColor : lightModeIconColor;
      return Scaffold(
        backgroundColor: _themeMode,
        appBar: appBar(
            _cardColor, _fontColor, 'First Year', themeNotifier, _iconColor,
            toolbarHeight: 64),
        body: Center(
          child: _chooseBook(context, _iconColor),
        ),
      );
    });
  }

  _chooseBook(context, _iconColor) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              noConnection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/1J5DEp_PGowChAcvm5LBz4vysV2oztQRi/view?usp=sharing');
                    },
                    'assets/firstyear/1styearEng.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'English'),
              noConnection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/1d8RBwXgLJq-9Rhp6G8sfGANxRSQ2phkS/view?usp=sharing');
                    },
                    'assets/firstyear/1styearMath.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'Mathematics')
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              noConnection(
                context,
                loadImageFromFirebase(
                  context,
                  () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1pVRt18A87At7TjmV-UjxlYdmwSLbGvIp/view?usp=sharing');
                  },
                  'assets/firstyear/physics.jpg',
                  _iconColor,
                ),
                _iconColor,
                'College Physics',
              ),
              noConnection(
                context,
                loadImageFromFirebase(
                  context,
                  () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1xHF_tVF0Bj2V1cshEi7JDS9cqi3QCA68/view?usp=sharing');
                  },
                  'assets/firstyear/Information-Teach.jpg',
                  _iconColor,
                ),
                _iconColor,
                'Information Technology',
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              noConnection(
                context,
                loadImageFromFirebase(
                  context,
                  () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1Fmuac3fpdvGy3E14SN9vW1Mk6WMMWhF2/view?usp=sharing');
                  },
                  'assets/firstyear/1styearOOP.jpg',
                  _iconColor,
                ),
                _iconColor,
                'OOP(C++)',
              ),
              noConnection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/1rTq7_-M93_ZbXXJswNdYW_j1zpFeo60r/view?usp=sharing');
                    },
                    'assets/firstyear/computer-fundamentals.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'Computer Fundamentals'),
            ],
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
