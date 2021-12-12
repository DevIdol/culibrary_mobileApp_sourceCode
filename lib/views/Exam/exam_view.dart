import 'package:culibrary/animation/add_floatingactionbutton.dart';
import 'package:culibrary/api/package_api.dart';
import 'package:culibrary/api/text_api.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/screens/loading_screen.dart';
import 'package:culibrary/views/Exam/exam_add.dart';
import 'package:culibrary/views/Exam/exam_update.dart';
import 'package:culibrary/widgets/appbar_widget.dart';
import 'package:culibrary/widgets/delete_dialog.dart';
import 'package:culibrary/widgets/no_data.dart';
import 'package:culibrary/widgets/toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../color_themes.dart';

class ExamView extends StatefulWidget {
  const ExamView({Key? key}) : super(key: key);

  @override
  _ExamViewState createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _translateButton;
  final _controller = ScrollController();
  bool _isOpened = false;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 50))
      ..addListener(() {
        setState(() {});
      });
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _translateButton = Tween<double>(begin: 200, end: -6.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.0, 0.75, curve: Curves.easeOut)));
    super.initState();
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels > 0) {
          if (_isVisible) {
            setState(() {
              _isVisible = false;
            });
          } else {
            if (!_isVisible) {
              setState(() {
                _isVisible = true;
              });
            }
          }
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _animationController.dispose();
  }

  animate() {
    if (!_isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    _isOpened = !_isOpened;
  }

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
          appBar: appBar(_cardColor, _fontColor, 'Exam Date & Time',
              themeNotifier, _iconColor,
              toolbarHeight: 60),
          body: _examData(themeNotifier, _themeMode, _iconColor, _fontColor),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Transform(
                  transform: Matrix4.translationValues(
                      0.9, _translateButton.value * 3.0, 0.0),
                  child: add(_iconColor, _isVisible, () {
                    setState(() {
                      if (!_isOpened) {
                        _animationController.forward();
                      } else {
                        _animationController.reverse();
                      }
                      _isOpened = !_isOpened;
                      Navigator.push(context,
                          addFloatingActionButton(const AddExamDateTime()));
                    });
                  })),
              Transform(
                  transform: Matrix4.translationValues(
                      0.9, _translateButton.value * 2.0, 0.0),
                  child: delete(_iconColor, _isVisible, () {
                    setState(() {
                      if (exams.isEmpty) {
                        return;
                      } else {
                        deleteDialog(context, () {
                          examDao.deletAllExams(exams);
                        }, _themeMode, _iconColor, 'DeleteAll Exam DateTime',
                            'Are you sure?');
                      }
                    });
                  })),
              toggle(_iconColor, _isVisible, animate, _animation)
            ],
          ));
    });
  }

  _examData(themeNotifier, _themeMode, _iconColor, _fontColor) {
    return StreamBuilder(
      stream: examDao.getAllExams(),
      builder: (context, dynamic data) {
        if (data.hasData) {
          exams = data.data;
          if (exams.isEmpty) {
            return Center(
              child: noData(
                  'No Exam Date And Time', 'Tab the add button to create.'),
            );
          } else {
            return ListView.builder(
              controller: scrollView,
              itemCount: data.data.length,
              itemBuilder: (context, position) {
                final _currentDate = formatDate.format(now);
                final _inputDate = data.data[position].examDate;
                final _todayDate = _currentDate == _inputDate;

                return Padding(
                  padding: const EdgeInsets.only(top: 16, left: 12, right: 12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Date: ${data.data[position].examDate}',
                            style: TextStyle(
                                fontSize: _todayDate ? 16 : 14,
                                fontWeight: _todayDate
                                    ? FontWeight.w900
                                    : FontWeight.w500,
                                color: _todayDate ? _iconColor : _fontColor),
                          ),
                          Text(
                            'Time: ${data.data[position].examTime}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: _todayDate
                                    ? FontWeight.w900
                                    : FontWeight.w500,
                                color: _todayDate ? _iconColor : _fontColor),
                          ),
                        ],
                      ),
                      Slidable(
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
                                Get.to(const UpdateExamDateTime(),
                                    arguments: data.data[position]);
                              },
                            ),
                          )
                        ],
                        secondaryActions: [
                          SizedBox(
                            height: 64,
                            child: IconSlideAction(
                              caption: 'Delete',
                              closeOnTap: true,
                              icon: Icons.delete,
                              color: Colors.red,
                              onTap: () {
                                deleteDialog(context, () {
                                  examDao.deleteExam(data.data[position]);
                                }, _themeMode, _iconColor,
                                    data.data[position].subject, deleteAlert);
                              },
                            ),
                          )
                        ],
                        child: InkWell(
                          onLongPress: () {
                            deleteDialog(context, () {
                              examDao.deleteExam(data.data[position]);
                            }, _themeMode, _iconColor,
                                data.data[position].subject, deleteAlert);
                          },
                          onDoubleTap: () {
                            Get.to(const UpdateExamDateTime(),
                                arguments: data.data[position]);
                          },
                          child: Card(
                            color: themeNotifier.isDark
                                ? _todayDate
                                    ? lightFontColor
                                    : darkCardColor
                                : _todayDate
                                    ? darkFontColor
                                    : lightCardColor,
                            elevation: 6,
                            shadowColor: themeNotifier.isDark
                                ? darkShawdowColor
                                : lightShawdowColor,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: _todayDate ? _iconColor : secondColor,
                                  width: _todayDate ? 1.4 : 0.4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: _todayDate
                                  ? ClipOval(
                                      child: Container(
                                        color: _iconColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2, vertical: 10),
                                        child: Text(
                                          "Today",
                                          style: TextStyle(
                                              color: themeNotifier.isDark
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  : null,
                              title: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: _todayDate
                                    ? Text(
                                        data.data[position].subject,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: _iconColor,
                                            fontWeight: _todayDate
                                                ? FontWeight.w900
                                                : FontWeight.w500),
                                      )
                                    : Center(
                                        child: Text(
                                          data.data[position].subject,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: _iconColor,
                                              fontWeight: _todayDate
                                                  ? FontWeight.w900
                                                  : FontWeight.w500),
                                        ),
                                      ),
                              ),
                              subtitle: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: _todayDate
                                    ? Text(data.data[position].note)
                                    : Center(
                                        child: Text(data.data[position].note),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        } else if (data.hasError) {
          return const LoadingScreen();
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
