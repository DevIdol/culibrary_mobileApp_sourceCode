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
            _cardColor, _fontColor, 'Third Year', themeNotifier, _iconColor),
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
              no_connection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/10ll7ASQPa8fs4Gur6Lq_K-kER-lDxX8A/view?usp=sharing');
                    },
                    'assets/thirdyear/3math.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'Mathematics'),
              no_connection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/1AFL3wDiHswreeZmsYqO88P9eBm0ztcTk/view?usp=sharing');
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
              no_connection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/1oZoqY3ZBMLM10ABCiSFCIS9J3Ln7VEa_/view?usp=sharing');
                    },
                    'assets/thirdyear/dataCommunication.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'Data Communications'),
              no_connection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/1VvbdaVifPLlUrrJxDMxOiobiYp0dxwjp/view?usp=sharing');
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
              no_connection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1hlt0SaO78hRTjUK7wmrbILN59sOmbufX/view?usp=sharing');
                  }, 'assets/thirdyear/programmingL11.jpg', _iconColor),
                  _iconColor,
                  'Programming Language'),
              no_connection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/1d9FxCbAMg8PUaRvsMn1j4TtINVkz7eIk/view?usp=sharing');
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
              no_connection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1zXdfZuhhXN-7oEQq4n2F7z5OwpmC1xQI/view?usp=sharing');
                  }, 'assets/secondyear/databaseconcept.jpg', _iconColor),
                  _iconColor,
                  'Database System Concepts'),
              no_connection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1LpQe3C-jVYUxLKaZlyA4nYg86qeX5Yra/view?usp=sharing');
                  }, 'assets/secondyear/databasesystem.jpg', _iconColor),
                  _iconColor,
                  'Database Systems')
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
                              'https://drive.google.com/file/d/1F2Ht-huGsPf-oTfXm9SiBwTYmuTZBUcC/view?usp=sharing');
                    },
                    'assets/thirdyear/hci.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'H C I'),
              no_connection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://1drv.ms/b/s!Ag2kIDUsRn6jcG2CqRThuwaVw4A?e=tzrim0');
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
              no_connection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/1alLQn-MxXm4uCpJNdB9GBeBS-zRYqVnX/view?usp=sharing');
                    },
                    'assets/thirdyear/E_Device&E_Circuit.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'E-Device & E-Circuit '),
              no_connection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://1drv.ms/b/s!Ag2kIDUsRn6jeAa-Tc6g3x7u6Wo?e=EdYGCX');
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
