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

class UpdateSubject extends StatefulWidget {
  const UpdateSubject({Key? key}) : super(key: key);

  @override
  _UpdateSubjectState createState() => _UpdateSubjectState();
}

class _UpdateSubjectState extends State<UpdateSubject> {
  final TextEditingController _subject = TextEditingController();
  final TextEditingController _subjectName = TextEditingController();
  final TextEditingController _teacher = TextEditingController();
  Sub sub = Get.arguments;
  @override
  Widget build(BuildContext context) {
    _subject.text = sub.subject!;
    _subjectName.text = sub.subjectName!;
    _teacher.text = sub.teacher!;

    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      final _themeMode = themeNotifier.isDark ? darkMode : lightMode;
      final _cardColor = themeNotifier.isDark ? darkCardColor : lightCardColor;
      final _fontColor = themeNotifier.isDark ? darkFontColor : lightFontColor;
      final _iconColor =
          themeNotifier.isDark ? darkModeIconColor : lightModeIconColor;
      return Scaffold(
        backgroundColor: _themeMode,
        appBar: inputAppBar(themeNotifier, _cardColor, _fontColor,
            'Edit Subject & Teacher Name'),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(14),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  textFormField(
                      _iconColor, _fontColor, subjectType, _subject, 16,
                      (value) {
                    if (value!.isEmpty) {
                      return emptyValidate;
                    } else if (value!.length > 14) {
                      return 'Your note can\'t be more than 14.(Eg:👉 CST-....)';
                    }

                    return null;
                  }, 1),
                  textFormField(
                      _iconColor, _fontColor, 'Subject Name', _subjectName, 102,
                      (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your subject name.(Eg:👉 English)';
                    } else if (value!.length > 100) {
                      return 'Subject Name is too long.(Eg:👉 English)';
                    }
                    return null;
                  }, null),
                  textFormField(
                      _iconColor, _fontColor, 'Teacher Name', _teacher, 102,
                      (value) {
                    if (value!.length > 100) {
                      return 'Teacher Name is too long.';
                    }
                    return null;
                  }, null),
                  const SizedBox(height: 40),
                  buttonWidget(_iconColor, () {
                    if (formKey.currentState!.validate()) {
                      subDao.updateSub(Sub(
                          _subject.text, _subjectName.text, _teacher.text,
                          id: sub.id));
                      Get.back();
                    }
                  }, 'Save', _themeMode, themeNotifier)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
