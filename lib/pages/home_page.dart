// ignore_for_file: duplicate_import
import 'dart:io';
import 'package:culibrary/animation/page_animation_transition.dart';
import 'package:culibrary/api/pdf_api.dart';
import 'package:culibrary/color_themes.dart';
import 'package:culibrary/pages/about_page.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/views/Exam/exam_view.dart';
import 'package:culibrary/views/Note/note_view.dart';
import 'package:culibrary/views/PDFViewer/pdf_viewer.dart';
import 'package:culibrary/views/PDFViewer/pdf_viewer.dart';
import 'package:culibrary/views/TextBook/select_year.dart';
import 'package:culibrary/views/TimeTable/time_table.dart';
import 'package:culibrary/widgets/appbar_widget.dart';
import 'package:culibrary/widgets/home_choose_button.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            _cardColor,
            _fontColor,
            'CU LIBRARY',
            themeNotifier,
            _iconColor,
            leadingWidth: 42,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset('assets/icon.png'),
            ),
            toolbarHeight: 70,
          ),
          body: Center(
            child: _selectButton(context, _themeMode, _iconColor),
          ));
    });
  }

  _selectButton(context, _themeMode, _iconColor) {
    final width = MediaQuery.of(context).size.width * 0.41;
    final height = MediaQuery.of(context).size.height * 0.24;
    return SingleChildScrollView(
      child: DoubleBackToCloseApp(
        snackBar: SnackBar(
          duration: const Duration(milliseconds: 1000),
          backgroundColor: _themeMode,
          content: Text(
            'Double back to exit from the app.',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: _iconColor),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                chooseButton(() {
                  Navigator.push(
                    context,
                    pageAnimationTransition(const TimeTableView(),
                        Alignment.center, Axis.horizontal),
                  );
                },
                    height,
                    width,
                    Image.asset(
                      'assets/timetable.png',
                      width: 46,
                      height: 46,
                    ),
                    'TimeTable',
                    10,
                    10,
                    10,
                    10),
                chooseButton(() {
                  Navigator.push(
                      context,
                      pageAnimationTransition(const SelectYear(),
                          Alignment.bottomRight, Axis.vertical));
                },
                    height,
                    width,
                    Image.asset(
                      'assets/textbook.png',
                      width: 46,
                      height: 46,
                    ),
                    'TextBook',
                    10,
                    10,
                    10,
                    10)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                chooseButton(() {
                  Navigator.push(
                      context,
                      pageAnimationTransition(const NoteView(),
                          Alignment.centerLeft, Axis.vertical));
                },
                    height,
                    width,
                    Image.asset(
                      'assets/note.png',
                      width: 46,
                      height: 46,
                    ),
                    'Note',
                    10,
                    10,
                    10,
                    10),
                chooseButton(() {
                  Navigator.push(
                      context,
                      pageAnimationTransition(const ExamView(),
                          Alignment.topRight, Axis.horizontal));
                },
                    height,
                    width,
                    Image.asset(
                      'assets/exam.png',
                      width: 46,
                      height: 46,
                    ),
                    'Exam DateTime',
                    10,
                    10,
                    10,
                    10)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                chooseButton(() async {
                  final file = await PDFApi.pickFile();

                  if (file == null) return;
                  openPDF(context, file);
                },
                    height,
                    width,
                    Image.asset(
                      'assets/pdfviewer.png',
                      width: 46,
                      height: 46,
                    ),
                    'PDF Viewer',
                    10,
                    10,
                    10,
                    10),
                chooseButton(() {
                  Navigator.push(
                      context,
                      pageAnimationTransition(const AboutPage(),
                          Alignment.topRight, Axis.vertical));
                },
                    height,
                    width,
                    Image.asset(
                      'assets/person.png',
                      width: 46,
                      height: 46,
                    ),
                    'About',
                    10,
                    10,
                    10,
                    10)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );
}
