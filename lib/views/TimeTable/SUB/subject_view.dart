import 'package:culibrary/api/package_api.dart';
import 'package:culibrary/api/text_api.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/screens/loading.dart';
import 'package:culibrary/views/TimeTable/SUB/subject_update.dart';
import 'package:culibrary/widgets/delete_dialog.dart';
import 'package:culibrary/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../color_themes.dart';

class SubjectView extends StatefulWidget {
  const SubjectView({Key? key}) : super(key: key);

  @override
  _SubjectViewState createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      final _themeMode = themeNotifier.isDark ? darkMode : lightMode;
      final _iconColor =
          themeNotifier.isDark ? darkModeIconColor : lightModeIconColor;
      return Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: subjectData(themeNotifier, _iconColor, _themeMode),
      );
    });
  }

  subjectData(themeNotifier, _iconColor, _themeMode) {
    return StreamBuilder(
        stream: subDao.getAllSubs(),
        builder: (context, dynamic data) {
          if (data.hasData) {
            subs = data.data;
            if (subs.isEmpty) {
              return noData('No Subject & Teacher Name', '');
            } else {
              return ListView.builder(
                controller: scrollView,
                itemCount: data.data.length,
                itemBuilder: (context, position) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 14, left: 12, right: 12),
                    child: Slidable(
                      actionPane: const SlidableDrawerActionPane(),
                      actions: [
                        SizedBox(
                          height: 64,
                          child: IconSlideAction(
                            caption: 'Edit',
                            icon: Icons.edit,
                            foregroundColor: _themeMode,
                            color: _iconColor,
                            onTap: () {
                              Get.to(const UpdateSubject(),
                                  arguments: data.data[position]);
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
                                subDao.deleteSub(data.data[position]);
                              }, _themeMode, _iconColor,
                                  data.data[position].subject, deleteAlert);
                            },
                          ),
                        )
                      ],
                      child: InkWell(
                        onLongPress: () {
                          deleteDialog(context, () {
                            subDao.deleteSub(data.data[position]);
                          }, _themeMode, _iconColor,
                              data.data[position].subject, deleteAlert);
                        },
                        onDoubleTap: () {
                          Get.to(const UpdateSubject(),
                              arguments: data.data[position]);
                        },
                        child: Card(
                          color: themeNotifier.isDark
                              ? darkCardColor
                              : lightCardColor,
                          elevation: 6,
                          shadowColor: themeNotifier.isDark
                              ? darkShawdowColor
                              : lightShawdowColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: secondColor, width: 0.6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                data.data[position].subject,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: _iconColor),
                              ),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                data.data[position].subjectName,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 4),
                              child: Text(
                                data.data[position].teacher,
                                style: const TextStyle(
                                    fontSize: 12, color: secondColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          } else if (data.hasError) {
            return const LoadingWidget();
          } else {
            return const LoadingWidget();
          }
        });
  }
}
