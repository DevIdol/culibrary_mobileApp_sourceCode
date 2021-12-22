import 'package:culibrary/api/package_api.dart';
import 'package:culibrary/database/table.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../color_themes.dart';

class NoteUpdate extends StatefulWidget {
  const NoteUpdate({Key? key}) : super(key: key);

  @override
  _NoteUpdateState createState() => _NoteUpdateState();
}

class _NoteUpdateState extends State<NoteUpdate> {
  final TextEditingController _date = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  Note note = Get.arguments;
  @override
  Widget build(BuildContext context) {
    _date.text = note.date!;
    _title.text = note.title!;
    _contact.text = note.contact!;
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      final _themeMode = themeNotifier.isDark ? darkMode : lightMode;
      final _cardColor = themeNotifier.isDark ? darkCardColor : lightCardColor;
      final _fontColor = themeNotifier.isDark ? darkFontColor : lightFontColor;
      final _iconColor =
          themeNotifier.isDark ? darkModeIconColor : lightModeIconColor;
      return Scaffold(
        backgroundColor: _themeMode,
        appBar: AppBar(
          foregroundColor: _fontColor,
          backgroundColor: _cardColor,
          toolbarHeight: 60,
          elevation: 20,
          shadowColor: themeNotifier.isDark ? Colors.white12 : Colors.black54,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: secondColor, width: 0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text(
            'Note',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Lora'),
          ),
          actions: [
            InkWell(
              onTap: () {
                noteDao.updateNote(
                    Note(_date.text, _title.text, _contact.text, id: note.id));

                var snackBar = SnackBar(
                  backgroundColor: _themeMode,
                  duration: const Duration(milliseconds: 500),
                  content: Text(
                    _title.text.length != note.title!.toString().length ||
                            _contact.text.length !=
                                note.contact!.toString().length
                        ? "Saved"
                        : '',
                    style: TextStyle(
                        color: _iconColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontFamily: 'Lora'),
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Text('Save',
                      style: TextStyle(
                          color: _iconColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.1,
                          fontFamily: 'Lora')),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: DoubleBack(
            message: 'Double back!',
            waitForSecondBackPress: 1,
            textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: _fontColor,
                fontFamily: 'Lora'),
            background: _themeMode,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _title,
                    cursorColor: _iconColor,
                    showCursor: true,
                    inputFormatters: [LengthLimitingTextInputFormatter(61)],
                    autocorrect: true,
                    textCapitalization: TextCapitalization.words,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length > 60) {
                        return "Title is too long.";
                      }
                    },
                    style: TextStyle(
                        color: _fontColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lora'),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                        hintStyle: TextStyle(
                            fontSize: 18,
                            color: secondColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lora'),
                        focusColor: firstColor),
                  ),
                  TextFormField(
                    controller: _contact,
                    cursorColor: _iconColor,
                    showCursor: true,
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: null,
                    style: TextStyle(
                        color: _fontColor, fontSize: 18, fontFamily: 'Lora'),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Description',
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: secondColor,
                            fontFamily: 'Lora'),
                        focusColor: _iconColor),
                  ),
                  SizedBox(height: 40)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
