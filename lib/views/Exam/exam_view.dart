import 'package:animated_text_kit/animated_text_kit.dart';
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
import 'package:flutter/rendering.dart';
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
  bool _floatAButton = true;

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
              toolbarHeight: 70),
          body: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.direction == ScrollDirection.forward) {
                if (!_floatAButton)
                  setState(() {
                    _floatAButton = true;
                  });
              } else if (notification.direction == ScrollDirection.reverse) {
                if (_floatAButton)
                  setState(() {
                    _floatAButton = false;
                  });
              }
              return true;
            },
            child: Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: _examData(
                    themeNotifier, _themeMode, _iconColor, _fontColor)),
          ),
          floatingActionButton: Visibility(
            visible: _floatAButton,
            child: Column(
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
                          return noDatas(context, _themeMode, _iconColor);
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
            ),
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
              child: noData('No Exam Date And Time', ''),
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
                  padding: const EdgeInsets.only(top: 14, left: 12, right: 12),
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
                        }, _themeMode, _iconColor, data.data[position].subject,
                            deleteAlert);
                      },
                      onDoubleTap: () {
                        Get.to(const UpdateExamDateTime(),
                            arguments: data.data[position]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeNotifier.isDark
                              ? _todayDate
                                  ? darkMode
                                  : darkCardColor
                              : _todayDate
                                  ? darkFontColor
                                  : lightCardColor,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          border: Border.all(
                              color: _todayDate ? _iconColor : secondColor,
                              width: _todayDate ? 1.4 : 0.99),
                          boxShadow: [
                            _todayDate
                                ? BoxShadow(
                                    blurStyle: BlurStyle.inner,
                                    blurRadius: 100,
                                    color: _iconColor,
                                    offset: Offset(
                                      0,
                                      4,
                                    ),
                                  )
                                : BoxShadow()
                          ],
                        ),
                        child: ListTile(
                          leading: _todayDate
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: ClipOval(
                                    child: Container(
                                      color: _iconColor,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 14),
                                      child: AnimatedTextKit(
                                        animatedTexts: [
                                          WavyAnimatedText("Today",
                                              textStyle: TextStyle(
                                                  color: themeNotifier.isDark
                                                      ? lightFontColor
                                                      : darkFontColor,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w900,
                                                  fontFamily: fontStyle),
                                              speed: const Duration(
                                                  milliseconds: 200))
                                        ],
                                        isRepeatingAnimation: true,
                                        repeatForever: true,
                                        displayFullTextOnTap: true,
                                      ),
                                    ),
                                  ),
                                )
                              : null,
                          title: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                data.data[position].subject,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: _iconColor,
                                    fontWeight: _todayDate
                                        ? FontWeight.w900
                                        : FontWeight.w500,
                                    fontFamily: fontStyle),
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 6, top: 4),
                                  child: Text(
                                    'Date: ${data.data[position].examDate} - Time: ${data.data[position].examTime}',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: fontStyle),
                                  ),
                                ),
                                _todayDate
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 6, left: 6, top: 6),
                                        child: Text(data.data[position].note),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, bottom: 4),
                                        child: Text(data.data[position].note),
                                      ),
                              ],
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
          return const LoadingScreen();
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
