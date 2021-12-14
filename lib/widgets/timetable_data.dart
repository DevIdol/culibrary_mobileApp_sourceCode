import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:culibrary/api/package_api.dart';
import 'package:culibrary/api/text_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../color_themes.dart';
import 'delete_dialog.dart';

timetableList(
  data,
  pageRoute,
  delete,
  _iconColor,
  _themeMode,
  themeNotifier,
) {
  return ListView.builder(
    controller: scrollView,
    itemCount: data.data.length,
    itemBuilder: (context, position) {
      final _current = formatTime.format(now);

      final DateTime _currentTime = formatTime.parse(_current);

      final DateTime _open = formatTime.parse(data.data[position].startTime);

      DateTime _close = formatTime.parse(data.data[position].endTime);

      final _todayTime = tabController.index + 1 == currentWeekDay &&
          _currentTime.isAfter(_open) &&
          _currentTime.isBefore(_close);

      return Padding(
        padding: const EdgeInsets.only(top: 12, left: 14, right: 14),
        child: Slidable(
          actionPane: const SlidableDrawerActionPane(),
          actions: [
            SizedBox(
              height: 70,
              child: IconSlideAction(
                caption: 'Edit',
                icon: Icons.edit,
                foregroundColor: _themeMode,
                color: _iconColor,
                onTap: () {
                  Get.to(pageRoute, arguments: data.data[position]);
                },
              ),
            )
          ],
          secondaryActions: [
            SizedBox(
              height: 70,
              child: IconSlideAction(
                caption: 'Delete',
                closeOnTap: true,
                icon: Icons.delete,
                color: Colors.red,
                onTap: () {
                  deleteDialog(context, () {
                    delete(data.data[position]);
                  }, _themeMode, _iconColor, data.data[position].subject,
                      deleteAlert);
                },
              ),
            )
          ],
          child: InkWell(
            onDoubleTap: () {
              Get.to(pageRoute, arguments: data.data[position]);
            },
            onLongPress: () {
              deleteDialog(context, () {
                delete(data.data[position]);
              }, _themeMode, _iconColor, data.data[position].subject,
                  deleteAlert);
            },
            child: Card(
              color: themeNotifier.isDark
                  ? _todayTime
                      ? darkMode
                      : darkCardColor
                  : _todayTime
                      ? darkFontColor
                      : lightCardColor,
              elevation: _todayTime ? 4 : 3,
              shadowColor: _todayTime ? darkFontColor : null,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: _todayTime ? _iconColor : secondColor,
                    width: _todayTime ? 1.4 : 0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      data.data[position].subject,
                      style: TextStyle(
                          fontSize: _todayTime ? 16 : 14.8,
                          color: _iconColor,
                          letterSpacing: 0.5,
                          fontWeight:
                              _todayTime ? FontWeight.w900 : FontWeight.w500),
                    ),
                  ),
                  subtitle: Text(
                    'Time: ${data.data[position].startTime} - ${data.data[position].endTime}',
                    style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 4),
                  child: Text(
                    data.data[position].note,
                    style: TextStyle(
                        fontSize: 12, color: secondColor, letterSpacing: 0.5),
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: _todayTime
                      ? ClipOval(
                          child: Container(
                            color: _iconColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 10),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                WavyAnimatedText("NOW",
                                    textStyle: TextStyle(
                                        color: themeNotifier.isDark
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w900),
                                    speed: const Duration(milliseconds: 160))
                              ],
                              isRepeatingAnimation: true,
                              repeatForever: true,
                              displayFullTextOnTap: true,
                            ),
                          ),
                        )
                      : null,
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
