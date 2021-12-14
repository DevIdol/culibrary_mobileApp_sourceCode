import 'package:culibrary/api/package_api.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/screens/loading.dart';
import 'package:culibrary/views/TimeTable/TUE/tuesday_update.dart';
import 'package:culibrary/widgets/no_data.dart';
import 'package:culibrary/widgets/timetable_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../color_themes.dart';

class TuesdayView extends StatefulWidget {
  const TuesdayView({Key? key}) : super(key: key);

  @override
  _TuesdayViewState createState() => _TuesdayViewState();
}

class _TuesdayViewState extends State<TuesdayView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      final _themeMode = themeNotifier.isDark ? darkMode : lightMode;
      final _iconColor =
          themeNotifier.isDark ? darkModeIconColor : lightModeIconColor;
      return Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: tuesdayData(themeNotifier, _iconColor, _themeMode),
      );
    });
  }

  tuesdayData(themeNotifier, _iconColor, _themeMode) {
    return StreamBuilder(
        stream: tueDao.getAllTues(),
        builder: (context, dynamic data) {
          if (data.hasData) {
            tues = data.data;
            if (tues.isEmpty) {
              return noData('No Time Table',
                  'Tap the add button to create a time table.');
            } else {
              return timetableList(data, const UpdateTuesdayClass(),
                  tueDao.deleteTue, _iconColor, _themeMode, themeNotifier);
            }
          } else if (data.hasError) {
            return const LoadingWidget();
          } else {
            return const LoadingWidget();
          }
        });
  }
}
