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
            child: Container(
              decoration: BoxDecoration(
                color: themeNotifier.isDark
                    ? _todayTime
                        ? darkMode
                        : darkCardColor
                    : _todayTime
                        ? darkFontColor
                        : lightCardColor,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(
                    color: _todayTime ? _iconColor : secondColor,
                    width: _todayTime ? 1 : 0.8),
                boxShadow: [
                  _todayTime
                      ? BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 8,
                          color: secondColor,
                          offset: Offset(
                            2,
                            2,
                          ),
                        )
                      : BoxShadow()
                ],
              ),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 6, top: 12),
                  child: Text(
                    data.data[position].subject,
                    style: TextStyle(
                        fontSize: _todayTime ? 16 : 14.8,
                        color: _iconColor,
                        letterSpacing: 0.5,
                        fontWeight:
                            _todayTime ? FontWeight.w900 : FontWeight.w500,
                        fontFamily: fontStyle),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        'Time: ${data.data[position].startTime} - ${data.data[position].endTime}',
                        style: TextStyle(
                            fontSize: 12,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold,
                            fontFamily: fontStyle),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 10, top: 8, left: 6),
                      child: Text(
                        data.data[position].note,
                        style: TextStyle(
                            fontSize: 12,
                            color: secondColor,
                            letterSpacing: 0.5,
                            fontFamily: fontStyle),
                      ),
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 12),
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
                                            ? lightFontColor
                                            : darkFontColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: fontStyle),
                                    speed: const Duration(milliseconds: 150))
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
