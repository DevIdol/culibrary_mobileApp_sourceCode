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
            _cardColor, _fontColor, 'First Year', themeNotifier, _iconColor),
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
              no_connection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/1vp5H_ZuzibeEKlj2Ekqv4zw-fXw10Msq/view?usp=sharing');
                    },
                    'assets/firstyear/1styearEng.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'English'),
              no_connection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/1guALqacRvkKRhhCRVOvkU1q4LTWJWy24/view?usp=sharing');
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
              no_connection(
                context,
                loadImageFromFirebase(
                  context,
                  () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1JMRQSff1HhykJMca2tD-6ML3vDtFfABY/view?usp=sharing');
                  },
                  'assets/firstyear/physics.jpg',
                  _iconColor,
                ),
                _iconColor,
                'College Physics',
              ),
              no_connection(
                context,
                loadImageFromFirebase(
                  context,
                  () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1RZTiCa-FY5KNS2TwGhECw0JA0ezjI3q-/view?usp=sharing');
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
              no_connection(
                context,
                loadImageFromFirebase(
                  context,
                  () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1P_6EGTk2Ij_GpVehO_0A1pMj-FErt0VH/view?usp=sharing');
                  },
                  'assets/firstyear/1styearOOP.jpg',
                  _iconColor,
                ),
                _iconColor,
                'OOP(C++)',
              ),
              no_connection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/1ywS3J_cxt3iUpXNG-_Mx3BCAs-1I1p2B/view?usp=sharing');
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
