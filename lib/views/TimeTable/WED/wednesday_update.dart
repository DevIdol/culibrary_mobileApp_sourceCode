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

class UpdateWednesdayClass extends StatefulWidget {
  const UpdateWednesdayClass({Key? key}) : super(key: key);

  @override
  _UpdateWednesdayClassState createState() => _UpdateWednesdayClassState();
}

class _UpdateWednesdayClassState extends State<UpdateWednesdayClass> {
  Wed wed = Get.arguments;
  @override
  Widget build(BuildContext context) {
    startTime.text = wed.startTime!;
    endTime.text = wed.endTime!;
    subject.text = wed.subject!;
    note.text = wed.note!;
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
            themeNotifier, _cardColor, _fontColor, 'Edit Wednesday Class'),
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
                      dateTimeFormField(
                        width,
                        _iconColor,
                        themeNotifier,
                        _themeMode,
                        _fontColor,
                        timeStart,
                        startTime,
                        formatTime,
                        (date) =>
                            (date == wed.startTime || startTime.text == '')
                                ? enterStartTime
                                : null,
                      ),
                      dateTimeFormField(
                        width,
                        _iconColor,
                        themeNotifier,
                        _themeMode,
                        _fontColor,
                        timeEnd,
                        endTime,
                        formatTime,
                        (date) => (date == wed.endTime || endTime.text == '')
                            ? enterEndTime
                            : null,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  textFormField(
                      _iconColor, _fontColor, subjectType, subject, 44,
                      (value) {
                    if (value!.isEmpty) {
                      return emptyValidate;
                    } else if (value.length > 42) {
                      return subjectValidate;
                    }
                    return null;
                  }),
                  textFormField(_iconColor, _fontColor, other, note, 101,
                      (value) {
                    if (value!.length > 100) {
                      return otherValidate;
                    }
                    return null;
                  }),
                  const SizedBox(height: 40),
                  buttonWidget(_iconColor, () {
                    if (formKey.currentState!.validate()) {
                      wedDao.updateWed(Wed(
                          startTime.text, endTime.text, subject.text, note.text,
                          id: wed.id));
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
