import 'package:culibrary/api/package_api.dart';
import 'package:culibrary/api/text_api.dart';
import 'package:culibrary/database/table.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/widgets/input_appbar.dart';
import 'package:culibrary/widgets/textformfield.dart';
import 'package:culibrary/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../color_themes.dart';

class AddExamDateTime extends StatefulWidget {
  const AddExamDateTime({Key? key}) : super(key: key);

  @override
  _AddExamDateTimeState createState() => _AddExamDateTimeState();
}

class _AddExamDateTimeState extends State<AddExamDateTime> {
  final TextEditingController _examDate = TextEditingController();
  final TextEditingController _examTime = TextEditingController();
  final TextEditingController _subject = TextEditingController();
  final TextEditingController _note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.4;
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      final _themeMode = themeNotifier.isDark ? darkMode : lightMode;
      final _cardColor = themeNotifier.isDark ? darkCardColor : lightCardColor;
      final _fontColor = themeNotifier.isDark ? darkFontColor : lightFontColor;
      final _iconColor =
          themeNotifier.isDark ? darkModeIconColor : lightModeIconColor;
      return Scaffold(
        backgroundColor: _themeMode,
        appBar: inputAppBar(
            themeNotifier, _cardColor, _fontColor, 'Add Exam Date & Time'),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(14),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dateFormField(
                        width,
                        _iconColor,
                        _themeMode,
                        themeNotifier,
                        _fontColor,
                        'Exam Date',
                        _examDate,
                        formatDate,
                        (date) => (date == null || _examDate.text == '')
                            ? 'Enter your exam date.'
                            : null,
                      ),
                      dateTimeFormField(
                        width,
                        _iconColor,
                        themeNotifier,
                        _themeMode,
                        _fontColor,
                        'Exam Time',
                        _examTime,
                        formatTime,
                        (date) => (date == null || _examTime.text == '')
                            ? 'Enter your exam time.'
                            : null,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  textFormField(
                      _iconColor, _fontColor, 'Subject', _subject, 101,
                      (value) {
                    if (value!.isEmpty) {
                      return 'Enter your subject.';
                    } else if (value.length > 100) {
                      return 'Subject name is too long.';
                    }
                    return null;
                  }, null),
                  textFormField(_iconColor, _fontColor, other, _note, 101,
                      (value) {
                    if (value!.length > 100) {
                      return 'Your note can\'t be more than 100.';
                    }
                    return null;
                  }, null),
                  const SizedBox(height: 40),
                  buttonWidget(_iconColor, () {
                    if (formKey.currentState!.validate()) {
                      examDao.addExam(Exam(_examDate.text, _examTime.text,
                          _subject.text, _note.text));
                      Get.back();
                    }
                  }, 'Add', _themeMode, themeNotifier)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
