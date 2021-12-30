import 'package:culibrary/api/url_launcher_api.dart';
import 'package:culibrary/provider/conectivity_provider.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/screens/no_signal.dart';
import 'package:culibrary/widgets/appbar_widget.dart';
import 'package:culibrary/widgets/load_image_firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../color_themes.dart';

class ThirdYearBooks extends StatefulWidget {
  const ThirdYearBooks({Key? key}) : super(key: key);

  @override
  State<ThirdYearBooks> createState() => _ThirdYearBooksState();
}

class _ThirdYearBooksState extends State<ThirdYearBooks> {
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
            _cardColor, _fontColor, 'Third Year', themeNotifier, _iconColor,
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
                              'https://drive.google.com/file/d/1oqr-x2J0UaKVY7Aw84ZS97LaruFCKNvg/view?usp=sharing');
                    },
                    'assets/thirdyear/3math.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'Mathematics'),
              noConnection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/1V_QygGvjt4k9fhld098IvmKPuP6VgM9I/view?usp=sharing');
                    },
                    'assets/thirdyear/operatingSystem.jpg',
                    _iconColor,
                  ),
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
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/1GuNQutQVoj5h_a1EeJ_q0e8QX_SjH_iE/view?usp=sharing');
                    },
                    'assets/thirdyear/dataCommunication.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'Data Communications'),
              noConnection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/16jbt0pKTpxFrzasglAf_tRnHWs7hzx-3/view?usp=sharing');
                    },
                    'assets/secondyear/softwareEngeneering.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'SoftwareEngeneering')
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
                            'https://drive.google.com/file/d/1ADEwhVU-irO8h_4lTesUBDIkEHT_6PlX/view?usp=sharing');
                  }, 'assets/thirdyear/programmingL11.jpg', _iconColor),
                  _iconColor,
                  'Programming Language'),
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
                  'JavaScript')
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
                            'https://drive.google.com/file/d/1dZOrq0s-F0AWMXobQR1puIVVIkfgNP4O/view?usp=sharing');
                  }, 'assets/secondyear/databaseconcept.jpg', _iconColor),
                  _iconColor,
                  'Database System Concepts'),
              noConnection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1_Hfc_lCI5bwumKxfIOaalJ8fpKSe5mfH/view?usp=sharing');
                  }, 'assets/secondyear/databasesystem.jpg', _iconColor),
                  _iconColor,
                  'Database Systems')
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
                              'https://drive.google.com/file/d/1Z6EfoBEeC5_jYVFoU-CPyMkrg2w_Dv6i/view?usp=sharing');
                    },
                    'assets/thirdyear/hci.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'H C I'),
              noConnection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://1drv.ms/b/s!Ag2kIDUsRn6jcG2CqRThuwaVw4A?e=TCdLMd');
                    },
                    'assets/thirdyear/computerOrganization.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'Computer Organization')
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
                              'https://drive.google.com/file/d/1QQY-i4OKOAT840joM9uJeGgqunTKFzo7/view?usp=sharing');
                    },
                    'assets/thirdyear/E_Device&E_Circuit.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'E-Device & E-Circuit '),
              noConnection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://1drv.ms/b/s!Ag2kIDUsRn6jeAa-Tc6g3x7u6Wo?e=W545eI');
                  }, 'assets/thirdyear/C#and.NetCore.jpg', _iconColor),
                  _iconColor,
                  'C# And .Net Core')
            ],
          ),
          const SizedBox(height: 60)
        ],
      ),
    );
  }
}
