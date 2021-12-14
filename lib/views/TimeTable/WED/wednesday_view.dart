import 'package:culibrary/api/package_api.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/screens/loading.dart';
import 'package:culibrary/widgets/no_data.dart';
import 'package:culibrary/widgets/timetable_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../color_themes.dart';
import 'wednesday_update.dart';

class WednesdayView extends StatefulWidget {
  const WednesdayView({Key? key}) : super(key: key);

  @override
  _WednesdayViewState createState() => _WednesdayViewState();
}

class _WednesdayViewState extends State<WednesdayView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      final _themeMode = themeNotifier.isDark ? darkMode : lightMode;
      final _iconColor =
          themeNotifier.isDark ? darkModeIconColor : lightModeIconColor;
      return Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: wednesdayData(themeNotifier, _iconColor, _themeMode),
      );
    });
  }

  wednesdayData(themeNotifier, _iconColor, _themeMode) {
    return StreamBuilder(
        stream: wedDao.getAllWeds(),
        builder: (context, dynamic data) {
          if (data.hasData) {
            weds = data.data;
            if (weds.isEmpty) {
              return noData('No Time Table',
                  'Tap the add button to create a time table.');
            } else {
              return timetableList(data, const UpdateWednesdayClass(),
                  wedDao.deleteWed, _iconColor, _themeMode, themeNotifier);
            }
          } else if (data.hasError) {
            return const LoadingWidget();
          } else {
            return const LoadingWidget();
          }
        });
  }
}
