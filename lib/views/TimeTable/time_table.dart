import 'package:culibrary/animation/add_floatingactionbutton.dart';
import 'package:culibrary/api/package_api.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/views/TimeTable/FRI/friday_add.dart';
import 'package:culibrary/views/TimeTable/FRI/friday_view.dart';
import 'package:culibrary/views/TimeTable/MON/monday_add.dart';
import 'package:culibrary/views/TimeTable/SUB/subject_view.dart';
import 'package:culibrary/views/TimeTable/THU/thursday_add.dart';
import 'package:culibrary/views/TimeTable/THU/thursday_view.dart';
import 'package:culibrary/views/TimeTable/TUE/tuesday_add.dart';
import 'package:culibrary/views/TimeTable/TUE/tuesday_view.dart';
import 'package:culibrary/views/TimeTable/WED/wednesday_add.dart';
import 'package:culibrary/views/TimeTable/WED/wednesday_view.dart';
import 'package:culibrary/widgets/appbar_widget.dart';
import 'package:culibrary/widgets/delete_dialog.dart';
import 'package:culibrary/widgets/no_data.dart';
import 'package:culibrary/widgets/toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../../color_themes.dart';
import 'MON/monday_view.dart';
import 'SUB/subject_add.dart';

class TimeTableView extends StatefulWidget {
  const TimeTableView({Key? key}) : super(key: key);

  @override
  State<TimeTableView> createState() => _TimeTableViewState();
}

class _TimeTableViewState extends State<TimeTableView>
    with TickerProviderStateMixin {
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

    if (currentWeekDay == 1) {
      tabController = TabController(length: 6, vsync: this, initialIndex: 0);
    } else if (currentWeekDay == 2) {
      tabController = TabController(length: 6, vsync: this, initialIndex: 1);
    } else if (currentWeekDay == 3) {
      tabController = TabController(length: 6, vsync: this, initialIndex: 2);
    } else if (currentWeekDay == 4) {
      tabController = TabController(length: 6, vsync: this, initialIndex: 3);
    } else if (currentWeekDay == 5) {
      tabController = TabController(length: 6, vsync: this, initialIndex: 4);
    } else if (currentWeekDay == 6) {
      tabController = TabController(length: 6, vsync: this, initialIndex: 5);
    } else {
      tabController = TabController(length: 6, vsync: this, initialIndex: 0);
    }

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
          appBar: appBar(
            _cardColor,
            _fontColor,
            'Daily Time Table',
            themeNotifier,
            _iconColor,
            tabBar: TabBar(
                controller: tabController,
                indicatorColor: themeNotifier.isDark
                    ? darkModeIconColor
                    : lightModeIconColor,
                unselectedLabelColor: _fontColor,
                indicatorWeight: 3.0,
                labelColor: _iconColor,
                labelPadding: EdgeInsets.all(0),
                labelStyle: const TextStyle(
                    fontFamily: 'Lora', fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    text: 'Mon',
                  ),
                  Tab(
                    text: 'Tue',
                  ),
                  Tab(
                    text: 'Wed',
                  ),
                  Tab(
                    text: 'Thu',
                  ),
                  Tab(
                    text: 'Fri',
                  ),
                  Tab(
                    text: 'Sub',
                  ),
                ]),
          ),
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
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: const [
                  MondayView(),
                  TuesdayView(),
                  WednesdayView(),
                  ThursdayView(),
                  FridayView(),
                  SubjectView()
                ]),
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
                      if (tabController.index == 0) {
                        setState(() {
                          if (!_isOpened) {
                            _animationController.forward();
                          } else {
                            _animationController.reverse();
                          }
                          _isOpened = !_isOpened;
                          Navigator.push(context,
                              addFloatingActionButton(const AddMondayClass()));
                        });
                      } else if (tabController.index == 1) {
                        setState(() {
                          if (!_isOpened) {
                            _animationController.forward();
                          } else {
                            _animationController.reverse();
                          }
                          _isOpened = !_isOpened;
                          Navigator.push(context,
                              addFloatingActionButton(const AddTuesdayClass()));
                        });
                      } else if (tabController.index == 2) {
                        setState(() {
                          if (!_isOpened) {
                            _animationController.forward();
                          } else {
                            _animationController.reverse();
                          }
                          _isOpened = !_isOpened;
                          Navigator.push(
                              context,
                              addFloatingActionButton(
                                  const AddWednesdayClass()));
                        });
                      } else if (tabController.index == 3) {
                        setState(() {
                          if (!_isOpened) {
                            _animationController.forward();
                          } else {
                            _animationController.reverse();
                          }
                          _isOpened = !_isOpened;
                          Navigator.push(
                              context,
                              addFloatingActionButton(
                                  const AddThursdayClass()));
                        });
                      } else if (tabController.index == 4) {
                        setState(() {
                          if (!_isOpened) {
                            _animationController.forward();
                          } else {
                            _animationController.reverse();
                          }
                          _isOpened = !_isOpened;
                          Navigator.push(context,
                              addFloatingActionButton(const AddFridayClass()));
                        });
                      } else {
                        setState(() {
                          if (!_isOpened) {
                            _animationController.forward();
                          } else {
                            _animationController.reverse();
                          }
                          _isOpened = !_isOpened;
                          Navigator.push(context,
                              addFloatingActionButton(const AddSubject()));
                        });
                      }
                    });
                  }),
                ),
                Transform(
                    transform: Matrix4.translationValues(
                        0.9, _translateButton.value * 2.0, 0.0),
                    child: delete(_iconColor, _isVisible, () {
                      setState(() {
                        if (tabController.index == 0) {
                          if (mons.isEmpty) {
                            return noDatas(context, _themeMode, _iconColor);
                          } else {
                            deleteDialog(context, () {
                              monDao.deletAllMons(mons);
                            }, _themeMode, _iconColor,
                                'DeleteAll Monday TimeTable', 'Are you sure?');
                          }
                        } else if (tabController.index == 1) {
                          if (tues.isEmpty) {
                            return noDatas(context, _themeMode, _iconColor);
                          } else {
                            deleteDialog(context, () {
                              tueDao.deletAllTues(tues);
                            }, _themeMode, _iconColor,
                                'DeleteAll Tuesday TimeTable', 'Are you sure?');
                          }
                        } else if (tabController.index == 2) {
                          if (weds.isEmpty) {
                            return noDatas(context, _themeMode, _iconColor);
                          } else {
                            deleteDialog(context, () {
                              wedDao.deletAllWeds(weds);
                            },
                                _themeMode,
                                _iconColor,
                                'DeleteAll Wednesday TimeTable',
                                'Are you sure?');
                          }
                        } else if (tabController.index == 3) {
                          if (thus.isEmpty) {
                            return noDatas(context, _themeMode, _iconColor);
                          } else {
                            deleteDialog(context, () {
                              thuDao.deletAllThus(thus);
                            },
                                _themeMode,
                                _iconColor,
                                'DeleteAll Thursday TimeTable',
                                'Are you sure?');
                          }
                        } else if (tabController.index == 4) {
                          if (fris.isEmpty) {
                            return noDatas(context, _themeMode, _iconColor);
                          } else {
                            deleteDialog(context, () {
                              friDao.deletAllFris(fris);
                            }, _themeMode, _iconColor,
                                'DeleteAll Friday TimeTable', 'Are you sure?');
                          }
                        } else {
                          if (subs.isEmpty) {
                            return noDatas(context, _themeMode, _iconColor);
                          } else {
                            deleteDialog(context, () {
                              subDao.deletAllSubs(subs);
                            },
                                _themeMode,
                                _iconColor,
                                'DeleteAll Subject & TeacherName',
                                'Are you sure?');
                          }
                        }
                      });
                    })),
                toggle(_iconColor, _isVisible, animate, _animation)
              ],
            ),
          ));
    });
  }
}
