import 'package:culibrary/api/url_launcher_api.dart';
import 'package:culibrary/provider/conectivity_provider.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/screens/no_signal.dart';
import 'package:culibrary/widgets/appbar_widget.dart';
import 'package:culibrary/widgets/load_image_firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../color_themes.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
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
            _cardColor, _fontColor, 'Library', themeNotifier, _iconColor, toolbarHeight: 64),
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
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url: 'https://www.w3schools.com/html/default.asp');
                  }, 'assets/library/html5.jpg', _iconColor),
                  _iconColor,
                  'Learn HTML'),
              no_connection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(url: 'https://www.w3schools.com/css/');
                  }, 'assets/library/css.png', _iconColor),
                  _iconColor,
                  'Learn CSS')
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
                            'https://drive.google.com/file/d/1K6rqzNQ6tZmJzxfbapaUFm8iatV7RkVU/view?usp=sharing');
                  }, 'assets/library/bootstrip.jpg', _iconColor),
                  _iconColor,
                  'Bootstrap By Ei Maung'),
              no_connection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1bAtisaXFeO4AEuV1cjhVPuy7R-uNNIUH/view?usp=sharing');
                  }, 'assets/library/jsem.jpg', _iconColor),
                  _iconColor,
                  'JavaScript By Ei Maung')
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
                            'https://drive.google.com/file/d/1Ya8I5KFg2rAxXvAkiuklynZSU3yMcQIW/view?usp=sharing');
                  }, 'assets/library/react.jpg', _iconColor),
                  _iconColor,
                  'React By Ei Maung'),
              no_connection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1fUiMWxvfVg8NaiRLjIK74uANwl35fOVU/view?usp=sharing');
                  }, 'assets/library/phpem.jpg', _iconColor),
                  _iconColor,
                  'PHP By Ei Maung')
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
                            'https://drive.google.com/file/d/1a0NqksYLrZYjKNw1QC2GOLW7DvGirR76/view?usp=sharing');
                  }, 'assets/library/laravel.jpg', _iconColor),
                  _iconColor,
                  'Laravel By Ei Maung'),
              no_connection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1fCaS45KpYqZEo0T7kdmaUl25KcjIZF5I/view?usp=sharing');
                  }, 'assets/library/api.jpg', _iconColor),
                  _iconColor,
                  'API By Ei Maung')
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
                            'https://drive.google.com/file/d/1zYf5_VuCa6e4no-ipCVefObQEQtIwDXg/view?usp=sharing');
                  }, 'assets/library/web.jpg', _iconColor),
                  _iconColor,
                  'Professional Web Developer\n              By Ei Maung'),
              no_connection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/13iBdHMRZqKdiuvvLvYYPsuWPfwcppryt/view?usp=sharing');
                  }, 'assets/library/rockstar.jpg', _iconColor),
                  _iconColor,
                  'Rockstar Developer\n       By Ei Maung')
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
                            'https://drive.google.com/file/d/1vq1oKD10r30bBe4LALPfoxKh3TizNf9i/view?usp=sharing');
                  }, 'assets/library/ubuntu.jpg', _iconColor),
                  _iconColor,
                  'Ubuntu-Linux By Ei Maung'),
              no_connection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://drive.google.com/file/d/1DV_qIbojyp0cRYzUM60MkVneOXUB3_Ox/view?usp=sharing');
                  }, 'assets/library/bitcoin.jpg', _iconColor),
                  _iconColor,
                  'Bitcoin By Ei Maung')
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
                        url: 'https://www.w3schools.com/js/default.asp');
                  }, 'assets/library/js.png', _iconColor),
                  _iconColor,
                  'JavaScript Tutorial'),
              no_connection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url: 'https://www.w3schools.com/jquery/default.asp');
                  }, 'assets/library/jquery.jpg', _iconColor),
                  _iconColor,
                  'JQuery Tutorial'),
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
                        url: 'https://www.w3schools.com/sql/default.asp');
                  }, 'assets/library/sql.jpg', _iconColor),
                  _iconColor,
                  'SQL Tutorial'),
              no_connection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url: 'https://www.w3schools.com/php/default.asp');
                  }, 'assets/library/php.png', _iconColor),
                  _iconColor,
                  'PHP Tutorial')
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
                        url: 'https://www.w3schools.com/java/default.asp');
                  }, 'assets/library/java.jpg', _iconColor),
                  _iconColor,
                  'Java Tutorial'),
              no_connection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(
                        url:
                            'https://www.tutorialspoint.com/flutter/index.htm');
                  }, 'assets/library/flutter.jpg', _iconColor),
                  _iconColor,
                  'Flutter Tutorial')
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
                        url: 'https://www.w3schools.com/python/default.asp');
                  }, 'assets/library/python.jpg', _iconColor),
                  _iconColor,
                  'Python Tutorial'),
              no_connection(
                  context,
                  loadImageFromFirebase(context, () async {
                    await Utils.openLink(url: 'https://zetcode.com/all/');
                  }, 'assets/library/code.png', _iconColor),
                  _iconColor,
                  'List of Programming\n Language Tutorials')
            ],
          ),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}
