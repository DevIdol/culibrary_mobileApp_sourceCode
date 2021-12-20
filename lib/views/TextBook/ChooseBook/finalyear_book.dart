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
                            'https://drive.google.com/file/d/1zeZkYLw74-pEBZOkAbvTCXLjC5TTiiUv/view?usp=sharing');
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
                              'https://drive.google.com/file/d/1kSfe8ZPDq8_0-x5vQ7AiM0ymXn3MtgE8/view?usp=sharing');
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
                            'https://drive.google.com/file/d/1ncXTzs9l_75mB6PN-MZCfnvRVpJzY0jj/view?usp=sharing');
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
                            'https://drive.google.com/file/d/1D2LMtlc_h7OnKI-tNiGn0B3MDt9g18Qf/view?usp=sharing');
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
                              'https://drive.google.com/file/d/1LEBJEwT9g34J93V-QO82U7kUWyrdAPwd/view?usp=sharing');
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
                              'https://drive.google.com/file/d/1cZVZ4kkCLF_WIR0LePsiZYNAi7Ti4Xgx/view?usp=sharing');
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
                              'https://drive.google.com/file/d/1diZwV0wgglmngFEMvIOB9NsoPG5o7o6y/view?usp=sharing');
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
                              'https://drive.google.com/file/d/1HDKmX4ykkOw4rtf-BdSTtqtpXRcxOPA1/view?usp=sharing');
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
                            'https://drive.google.com/file/d/1OFYVz6slz00hOScnpD99SJHPp5B9RUlG/view?usp=sharing');
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
