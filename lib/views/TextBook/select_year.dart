import 'package:culibrary/animation/page_animation_transition.dart';
import 'package:culibrary/color_themes.dart';
import 'package:culibrary/provider/conectivity_provider.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/views/TextBook/ChooseBook/finalyear_book.dart';
import 'package:culibrary/views/TextBook/ChooseBook/firstyear_book.dart';
import 'package:culibrary/views/TextBook/ChooseBook/fourthyear_book.dart';
import 'package:culibrary/views/TextBook/ChooseBook/library.dart';
import 'package:culibrary/views/TextBook/ChooseBook/secondyear_book.dart';
import 'package:culibrary/views/TextBook/ChooseBook/thirdyear_book.dart';
import 'package:culibrary/widgets/appbar_widget.dart';
import 'package:culibrary/widgets/home_choose_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectYear extends StatefulWidget {
  const SelectYear({Key? key}) : super(key: key);

  @override
  State<SelectYear> createState() => _SelectYearState();
}

class _SelectYearState extends State<SelectYear> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.39;
    final height = MediaQuery.of(context).size.height * 0.24;
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      final _themeMode = themeNotifier.isDark ? darkMode : lightMode;
      final _cardColor = themeNotifier.isDark ? darkCardColor : lightCardColor;
      final _fontColor = themeNotifier.isDark ? darkFontColor : lightFontColor;
      final _iconColor =
          themeNotifier.isDark ? darkModeIconColor : lightModeIconColor;
      return Scaffold(
          backgroundColor: _themeMode,
          appBar: appBar(
              _cardColor, _fontColor, 'Text Books', themeNotifier, _iconColor, toolbarHeight: 70),
          body: Center(
              child:
                  _selectYear(context, _themeMode, _iconColor, height, width)));
    });
  }

  Widget _selectYear(
      context, _themeMode, _iconColor, double height, double width) {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            chooseButton(() {
              Navigator.push(
                context,
                pageAnimationTransition(
                    FirstYearBooks(), Alignment.center, Axis.horizontal),
              );
            },
                height,
                width,
                Image.asset(
                  'assets/book1.png',
                  width: 36,
                  height: 36,
                ),
                'First Year',
                50,
                0,
                0,
                50),
            chooseButton(() {
              Navigator.push(
                  context,
                  pageAnimationTransition(const SecondYearBooks(),
                      Alignment.bottomRight, Axis.vertical));
            },
                height,
                width,
                Image.asset(
                  'assets/book2.png',
                  width: 36,
                  height: 36,
                ),
                'Second Year',
                0,
                50,
                50,
                0)
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            chooseButton(() {
              Navigator.push(
                  context,
                  pageAnimationTransition(const ThirdYearBooks(),
                      Alignment.centerLeft, Axis.vertical));
            },
                height,
                width,
                Image.asset(
                  'assets/book3.png',
                  width: 36,
                  height: 36,
                ),
                'Third Year',
                0,
                50,
                0,
                50),
            chooseButton(() {
              Navigator.push(
                  context,
                  pageAnimationTransition(const FourthYearBooks(),
                      Alignment.topRight, Axis.vertical));
            },
                height,
                width,
                Image.asset(
                  'assets/book4.png',
                  width: 36,
                  height: 36,
                ),
                'Fourth Year',
                50,
                0,
                50,
                0)
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            chooseButton(() {
              Navigator.push(
                  context,
                  pageAnimationTransition(const FinalYearBooks(),
                      Alignment.topLeft, Axis.horizontal));
            },
                height,
                width,
                Image.asset(
                  'assets/book5.png',
                  width: 36,
                  height: 36,
                ),
                'Final Year',
                0,
                50,
                50,
                0),
            chooseButton(() {
              Navigator.push(
                  context,
                  pageAnimationTransition(
                      const Library(), Alignment.topRight, Axis.horizontal));
            },
                height,
                width,
                Image.asset(
                  'assets/library.png',
                  width: 36,
                  height: 36,
                ),
                'Library',
                50,
                0,
                0,
                50)
          ],
        ),
        SizedBox(height: 20),
      ],
    ));
  }
}
