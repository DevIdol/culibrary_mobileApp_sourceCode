import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:culibrary/api/package_api.dart';
import 'package:culibrary/api/url_launcher_api.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../color_themes.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    String formattedYear = DateFormat('yyyy').format(now);

    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      final _themeMode = themeNotifier.isDark ? darkMode : lightMode;
      final _fontColor = themeNotifier.isDark ? darkFontColor : lightFontColor;
      final _iconColor =
          themeNotifier.isDark ? darkModeIconColor : lightModeIconColor;
      return Scaffold(
        backgroundColor: _themeMode,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Image.asset(
                'assets/icon.png',
                width: 130,
              ),
              const SizedBox(height: 20),
              DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 20,
                      color: _iconColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lora'),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('CU LIBRARY',
                          speed: const Duration(milliseconds: 150))
                    ],
                    isRepeatingAnimation: false,
                    repeatForever: false,
                    displayFullTextOnTap: true,
                    stopPauseOnTap: false,
                  )),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  """           I would like to say special thanks to Mg Kam Khan Pau (UCSK), Ma Nang Poei Shwe Sin (UCSK), and Ma Phyo Theint Theint Kyaw (UCSMdy) for their help to get PDF files TextBooks.
          In this app, you can check Daily Time Table, Text Book PDF, Note, Exam Date-Time and PDF Viewer. When you check to view the Text-Book PDF, using Google Drive and One Drive will be smoother than other browsers.
          This app may not be 100% convenient, but it will be expected to be useful to some extent.  Thanks to all users.""",
                  style: TextStyle(
                      fontSize: 14,
                      color: _fontColor,
                      letterSpacing: 0.01,
                      fontFamily: 'Lora'),
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => Utils.openLink(url: 'https://github.com/DevIdol'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText('Developed By DevIdol',
                                speed: const Duration(milliseconds: 80),
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Lora'))
                          ],
                          isRepeatingAnimation: false,
                          repeatForever: false,
                          displayFullTextOnTap: true,
                          stopPauseOnTap: false,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.copyright,
                            size: 18,
                            color: _iconColor,
                          ),
                          Text(
                            '2020-$formattedYear',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: _iconColor,
                                fontFamily: 'Lora'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Contact Info:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: _fontColor,
                        fontFamily: 'Lora'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildButton(
                  onClicked: () =>
                      Utils.openPhoneCall(phoneNumber: '09891489955'),
                  icon: Icon(
                    Icons.call,
                    color: _iconColor,
                  ),
                  text: 'Phone',
                  fontColor: _fontColor),
              const SizedBox(height: 20),
              _buildButton(
                  onClicked: () => Utils.openEmail(
                      toEmail: 'devidol.mm@gmail.com',
                      subject: 'Feedback',
                      body: ''),
                  icon: Icon(
                    Icons.mail,
                    color: _iconColor,
                  ),
                  text: 'Mail',
                  fontColor: _fontColor),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  height: 20,
                  color: secondColor,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'How To Use?',
                style: TextStyle(
                    color: secondColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    fontFamily: 'Lora'),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        '1. To Add Data',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: secondColor,
                            fontFamily: 'Lora'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Tap the add botton into the menu.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: secondColor,
                            fontFamily: 'Lora'),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        '2. To Edit Data',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: secondColor,
                            fontFamily: 'Lora'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Double Click on the card or Slide card to the left.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: secondColor,
                            fontFamily: 'Lora'),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        '3. To Delete Data',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: secondColor,
                            fontFamily: 'Lora'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Long press on the card or Slide card to the right.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: secondColor,
                            fontFamily: 'Lora'),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        '4. To Delete All Datas',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: secondColor,
                            fontFamily: 'Lora'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Tap the delete botton into the menu.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: secondColor,
                            fontFamily: 'Lora'),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  '5. Let me suggest using Google Drive and One Drive to view Text-Book PDF.',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _iconColor,
                      fontFamily: 'Lora'),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildButton({
    required onClicked,
    required icon,
    required text,
    required fontColor,
  }) =>
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          alignment: Alignment.topLeft,
          child: InkWell(
            onTap: onClicked,
            child: Row(
              children: [
                icon,
                const SizedBox(width: 10),
                Text(
                  text,
                  style: TextStyle(
                      color: fontColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lora'),
                )
              ],
            ),
          ),
        ),
      );
}
