import 'package:culibrary/api/package_api.dart';
import 'package:culibrary/api/text_api.dart';
import 'package:culibrary/database/table.dart';
import 'package:culibrary/provider/theme_provider.dart';
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
                fontFamily: fontStyle),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(
                    fontSize: 18,
                    color: secondColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: fontStyle),
                focusColor: firstColor),
          ),
        ),
        body: SingleChildScrollView(
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
                      color: _fontColor, fontSize: 18, fontFamily: fontStyle),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Description',
                      hintStyle: TextStyle(
                          fontSize: 16, color: secondColor, fontFamily: fontStyle),
                      focusColor: _iconColor),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          width:64,
          height: 30,
          child: FloatingActionButton(
            mini: true,
            backgroundColor: _iconColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: secondColor, width: 0.4),
                borderRadius: BorderRadius.circular(10)),
            onPressed: () {
               noteDao.addNote(Note(noteDate, _title.text, _contact.text));
              Get.back();
            },
            child: Text('Save',
                style: TextStyle(
                    color: _cardColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.1,
                    fontFamily: fontStyle)),
          ),
        ),
      );
    });
  }
}
