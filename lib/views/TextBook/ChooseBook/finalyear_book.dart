import 'package:culibrary/api/url_launcher_api.dart';
import 'package:culibrary/provider/conectivity_provider.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/screens/no_signal.dart';
import 'package:culibrary/widgets/appbar_widget.dart';
import 'package:culibrary/widgets/load_image_firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../color_themes.dart';

class FinalYearBooks extends StatefulWidget {
  const FinalYearBooks({Key? key}) : super(key: key);

  @override
  State<FinalYearBooks> createState() => _FinalYearBooksState();
}

class _FinalYearBooksState extends State<FinalYearBooks> {
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
            _cardColor, _fontColor, 'Final Year', themeNotifier, _iconColor, toolbarHeight: 64),
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
                            'https://1drv.ms/b/s!Ag2kIDUsRn6jcTz9KfgSiPwP1bU?e=runliz');
                  }, 'assets/finalyear/5E.jpg', _iconColor),
                  _iconColor,
                  'IELTS-13'),
              noConnection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://1drv.ms/b/s!Ag2kIDUsRn6jdZvGU9VA72iY2_E?e=x1aHK9');
                  }, 'assets/fourthyear/grammar.jpg', _iconColor),
                  _iconColor,
                  'Grammar')
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
                            'https://drive.google.com/file/d/18Q0TZgB3zIUQr6P3t_6QT-BOZo8p6Dap/view?usp=sharing');
                  }, 'assets/fourthyear/operationResearch.jpg', _iconColor),
                  _iconColor,
                  'Operation Research'),
              noConnection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://1drv.ms/b/s!Ag2kIDUsRn6jckTrF2F5ruc5Ncs?e=7sDSch');
                    },
                    'assets/finalyear/distributedSys.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'Distributed Systems')
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
                              'https://drive.google.com/file/d/1tcw0WmLSShNhLE3hZbcxruFDK3fOR9Xo/view?usp=sharing');
                    },
                    'assets/finalyear/TCPIP.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'T C P / I P'),
              noConnection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1EIlvXmZDXQfUn-4yZWqUOseVNvoPSQNE/view?usp=sharing');
                  }, 'assets/finalyear/securityManage.jpg', _iconColor),
                  _iconColor,
                  'Information Security')
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
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/1W1-Zc9EW5rMg_S2SpAdct_k37uOH8rVY/view?usp=sharing');
                    },
                    'assets/finalyear/systemManage.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'Enterprise Systems\n  For Management'),
              noConnection(
                  context,
                  loadImageFromFirebase(
                    context,
                    () async {
                      await Utils.openLink(
                          url:
                              'https://drive.google.com/file/d/1QJRcl95-JcU5SG-oUDzsMiK-Kd6jhbVo/view?usp=sharing');
                    },
                    'assets/finalyear/fuzzyLog.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  'Fuzzy Logic')
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
                              'https://drive.google.com/file/d/1miWm0EOsgPZry_XW6W4jfeo_uf4JI5zq/view?usp=sharing');
                    },
                    'assets/finalyear/networkSecure.jpg',
                    _iconColor,
                  ),
                  _iconColor,
                  ' Cryptography &\nNetwork Security'),
              noConnection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/15JVaU0E1e26ebithk3ShKUlnUsu_kypC/view?usp=sharing');
                  }, 'assets/finalyear/imageProcess.jpg', _iconColor),
                  _iconColor,
                  'Digital Image Processing')
            ],
          ),
          const SizedBox(height: 60)
        ],
      ),
    );
  }
}
