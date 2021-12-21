import 'package:culibrary/api/url_launcher_api.dart';
import 'package:culibrary/provider/conectivity_provider.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/screens/no_signal.dart';
import 'package:culibrary/widgets/appbar_widget.dart';
import 'package:culibrary/widgets/load_image_firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../color_themes.dart';

class SecondYearBooks extends StatefulWidget {
  const SecondYearBooks({Key? key}) : super(key: key);

  @override
  State<SecondYearBooks> createState() => _SecondYearBooksState();
}

class _SecondYearBooksState extends State<SecondYearBooks> {
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
            _cardColor, _fontColor, 'Second Year', themeNotifier, _iconColor,
            toolbarHeight: 64),
        body: _chooseBook(context, _iconColor),
      );
    });
  }

  _chooseBook(context, _iconColor) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
                            'https://drive.google.com/file/d/1xtAFOKlZZXj_ZBvqR7g4vvswS283RkNe/view?usp=sharing');
                  },
                  'assets/secondyear/html.jpg',
                  _iconColor,
                ),
                _iconColor,
                'HTML (Ch 1 - 7)',
              ),
              noConnection(
                context,
                loadImageFromFirebase(
                  context,
                  () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1aCedeDM8wPicAjdDKb16Pj9MurwrYyqv/view?usp=sharing');
                  },
                  'assets/secondyear/html.jpg',
                  _iconColor,
                ),
                _iconColor,
                'HTML (Ch 8 - 14)',
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
                            'https://drive.google.com/file/d/1uZ090Jtv73s8GPJox-gy5noqwuYc2gfv/view?usp=sharing');
                  },
                  'assets/secondyear/eng2nd.jpg',
                  _iconColor,
                ),
                _iconColor,
                'English',
              ),
              noConnection(
                context,
                loadImageFromFirebase(
                  context,
                  () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1yzBhTBQKqpRKqCmE0ad6mYRbyrs6JZEZ/view?usp=sharing');
                  },
                  'assets/secondyear/javascript.jpg',
                  _iconColor,
                ),
                _iconColor,
                'JavaScript',
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
                            'https://drive.google.com/file/d/1dY8TMbxQYFT2pIfxFHIHY3ReOqaoQsic/view?usp=sharing');
                  },
                  'assets/secondyear/java.jpg',
                  _iconColor,
                ),
                _iconColor,
                'Java',
              ),
              noConnection(
                context,
                loadImageFromFirebase(context, () async {
                  await Utils.openLink(
                      url:
                          'https://drive.google.com/file/d/1dZOrq0s-F0AWMXobQR1puIVVIkfgNP4O/view?usp=sharing');
                }, 'assets/secondyear/databaseconcept.jpg', _iconColor),
                _iconColor,
                'Database System Concepts',
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              noConnection(
                context,
                loadImageFromFirebase(context, () async {
                  await Utils.openLink(
                      url:
                          'https://drive.google.com/file/d/1_Hfc_lCI5bwumKxfIOaalJ8fpKSe5mfH/view?usp=sharing');
                }, 'assets/secondyear/databasesystem.jpg', _iconColor),
                _iconColor,
                'Database Systems',
              ),
              noConnection(
                context,
                loadImageFromFirebase(context, () async {
                  await Utils.openLink(
                      url:
                          'https://drive.google.com/file/d/16jbt0pKTpxFrzasglAf_tRnHWs7hzx-3/view?usp=sharing');
                }, 'assets/secondyear/softwareEngeneering.jpg', _iconColor),
                _iconColor,
                'Software Engeneering',
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              noConnection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://1drv.ms/b/s!Ag2kIDUsRn6jdGE68pIZ5gL6pRw?e=dizG17');
                  }, 'assets/secondyear/digitalFun.jpg', _iconColor),
                  _iconColor,
                  'Digital Fundamentals'),
              noConnection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1cDi95mfBX0A7guk4vyeJE2WQPbZAZzO0/view?usp=sharing');
                  }, 'assets/secondyear/logicDesign.jpg', _iconColor),
                  _iconColor,
                  'Programming Logic&Design')
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
