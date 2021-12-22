import 'package:culibrary/api/package_api.dart';
import 'package:culibrary/database/table.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../color_themes.dart';

class NoteAdd extends StatefulWidget {
  const NoteAdd({Key? key}) : super(key: key);

  @override
  _NoteAddState createState() => _NoteAddState();
}

class _NoteAddState extends State<NoteAdd> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _contact = TextEditingController();

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
        appBar: AppBar(
          foregroundColor: _fontColor,
          backgroundColor: _cardColor,
          toolbarHeight: 80,
          elevation: 20,
          shadowColor: themeNotifier.isDark ? Colors.white12 : Colors.black54,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: secondColor, width: 0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          title: TextFormField(
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
          actions: [
            InkWell(
              onTap: () {
                noteDao.addNote(Note(noteDate, _title.text, _contact.text));
                Get.back();
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Text('Save',
                      style: TextStyle(
                          color: _iconColor,
                          fontSize: 14,
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
                    controller: _contact,
                    cursorColor: _iconColor,
                    autofocus: true,
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
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
