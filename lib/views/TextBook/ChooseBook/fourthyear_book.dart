import 'package:culibrary/api/url_launcher_api.dart';
import 'package:culibrary/provider/conectivity_provider.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/screens/no_signal.dart';
import 'package:culibrary/widgets/appbar_widget.dart';
import 'package:culibrary/widgets/load_image_firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../color_themes.dart';

class FourthYearBooks extends StatefulWidget {
  const FourthYearBooks({Key? key}) : super(key: key);

  @override
  State<FourthYearBooks> createState() => _FourthYearBooksState();
}

class _FourthYearBooksState extends State<FourthYearBooks> {
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
            _cardColor, _fontColor, 'Fourth Year', themeNotifier, _iconColor, toolbarHeight: 64),
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
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://1drv.ms/b/s!Ag2kIDUsRn6jdZvGU9VA72iY2_E?e=ZYVsqZ');
                  }, 'assets/fourthyear/grammar.jpg', _iconColor),
                  _iconColor,
                  'Grammar'),
              noConnection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/18Q0TZgB3zIUQr6P3t_6QT-BOZo8p6Dap/view?usp=sharing');
                  }, 'assets/fourthyear/operationResearch.jpg', _iconColor),
                  _iconColor,
                  'Operation Research')
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
                            'https://drive.google.com/file/d/1w5BAXiCXLJFGHPllX_E26dBfvkHPG9lq/view?usp=sharing');
                  }, 'assets/fourthyear/graphic.jpg', _iconColor),
                  _iconColor,
                  'Computer Graphics'),
              noConnection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/1eWET78RS7bHaTyYoW6Ac5ob17SHxe3nd/view?usp=sharing');
                    },
                    'assets/fourthyear/datamining.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'Data Mining')
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
                            'https://drive.google.com/file/d/16jbt0pKTpxFrzasglAf_tRnHWs7hzx-3/view?usp=sharing');
                  }, 'assets/secondyear/softwareEngeneering.jpg', _iconColor),
                  _iconColor,
                  'Software Engeneering'),
              noConnection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://1drv.ms/b/s!Ag2kIDUsRn6jcwT7yT342-oNxxw?e=SVW0Ff');
                  }, 'assets/fourthyear/computerAlgo.jpg', _iconColor),
                  _iconColor,
                  'Analysis of Algorithms')
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
                            'https://drive.google.com/file/d/1BgSSdPa9JcF3NTGAeWFBWbnIIeozZ2-y/view?usp=sharing');
                  }, 'assets/fourthyear/AI.jpg', _iconColor),
                  _iconColor,
                  'Artificial Intelligence'),
              noConnection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                          'https://drive.google.com/file/d/1lS65X4Hxa9EUn9VfJFOzzKpfxpPh_b4I/view?usp=sharing');
                    },
                    'assets/fourthyear/informationSystem.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'M I S')
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
                              'https://drive.google.com/file/d/1E-nB0-FUaQgPl5mmhXfrsXXZ0kP5bBf-/view?usp=sharing');
                    },
                    'assets/fourthyear/digitalManagement.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  '      Digital Business and\nE-Commerce Management'),
              noConnection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1V_QygGvjt4k9fhld098IvmKPuP6VgM9I/view?usp=sharing');
                  }, 'assets/thirdyear/operatingSystem.jpg', _iconColor),
                  _iconColor,
                  'Operation Systems')
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
                            'https://drive.google.com/file/d/1_DgGRAAmauCRsDfjKKTUlUJSRL0xHb27/view?usp=sharing');
                  }, 'assets/fourthyear/UML.jpg', _iconColor),
                  _iconColor,
                  'U M L'),
              noConnection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://1drv.ms/b/s!Ag2kIDUsRn6jgQUhAml2bUCVBBGu?e=uVbW1G');
                    },
                    'assets/finalyear/networkSecure.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  '  Cryptography & \nNetWork Security')
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
                            'https://drive.google.com/file/d/1QQY-i4OKOAT840joM9uJeGgqunTKFzo7/view?usp=sharing');
                  }, 'assets/thirdyear/E_Device&E_Circuit.jpg', _iconColor),
                  _iconColor,
                  'E-Device & E-Circuit'),
              noConnection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1PcVBLzTStVX1Iam6_iSDat1hWL3vo2DN/view?usp=sharing');
                  }, 'assets/fourthyear/modernControl.jpg', _iconColor),
                  _iconColor,
                  'Modern Control systems')
            ],
          ),
          const SizedBox(height: 60)
        ],
      ),
    );
  }
}
