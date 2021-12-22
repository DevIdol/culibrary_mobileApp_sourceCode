import 'package:culibrary/animation/add_floatingactionbutton.dart';
import 'package:culibrary/api/package_api.dart';
import 'package:culibrary/api/text_api.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/screens/loading_screen.dart';
import 'package:culibrary/views/Note/note_add.dart';
import 'package:culibrary/views/Note/note_update.dart';
import 'package:culibrary/widgets/appbar_widget.dart';
import 'package:culibrary/widgets/delete_dialog.dart';
import 'package:culibrary/widgets/no_data.dart';
import 'package:culibrary/widgets/toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../color_themes.dart';

class NoteView extends StatefulWidget {
  const NoteView({Key? key}) : super(key: key);

  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> with TickerProviderStateMixin {
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
          appBar: appBar(
              _cardColor, _fontColor, 'All Notes', themeNotifier, _iconColor,
              toolbarHeight: 60),
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
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child:
                    _noteDate(_fontColor, _iconColor, _cardColor, _themeMode)),
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
                        Navigator.push(
                            context, addFloatingActionButton(const NoteAdd()));
                      });
                    })),
                Transform(
                    transform: Matrix4.translationValues(
                        0.9, _translateButton.value * 2.0, 0.0),
                    child: delete(_iconColor, _isVisible, () {
                      setState(() {
                        if (notes.isEmpty) {
                          return noDatas(context, _themeMode, _iconColor);
                        } else {
                          deleteDialog(context, () {
                            noteDao.deletAllNotes(notes);
                          }, _themeMode, _iconColor, 'DeleteAll Notes',
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

  _noteDate(_fontColor, _iconColor, _cardColor, _themeMode) {
    return StreamBuilder(
      stream: noteDao.getAllNotes(),
      builder: (context, dynamic data) {
        if (data.hasData) {
          notes = data.data;
          if (notes.isEmpty) {
            return Center(
              child: noData('No Note', 'Tab the add button to create a note.'),
            );
          } else {
            return StaggeredGridView.countBuilder(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              controller: scrollView,
              crossAxisCount: 4,
              itemCount: data.data.length,
              itemBuilder: (BuildContext context, position) => InkWell(
                onTap: () {
                  Get.to(const NoteUpdate(), arguments: data.data[position]);
                },
                onLongPress: () {
                  deleteDialog(context, () {
                    noteDao.deleteNote(data.data[position]);
                  },
                      _themeMode,
                      _iconColor,
                      data.data[position].title.toString().isEmpty
                          ? "No Title"
                          : data.data[position].title,
                      deleteAlert);
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: secondColor, width: 0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: _cardColor,
                  child: ListTile(
                    title: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          data.data[position].title.toString().isEmpty
                              ? "No Title"
                              : data.data[position].title,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize:
                                  data.data[position].title.toString().isEmpty
                                      ? 14
                                      : 16,
                              color:
                                  data.data[position].title.toString().isEmpty
                                      ? secondColor
                                      : _fontColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lora'),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            data.data[position].contact.toString().isEmpty
                                ? "No Description"
                                : data.data[position].contact,
                            maxLines: 4,
                            style: TextStyle(
                                fontSize: data.data[position].contact
                                        .toString()
                                        .isEmpty
                                    ? 10
                                    : 14,
                                color: data.data[position].contact
                                        .toString()
                                        .isEmpty
                                    ? secondColor
                                    : _fontColor,
                                fontFamily: 'Lora'),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          data.data[position].date,
                          style: TextStyle(
                              fontSize: 8,
                              color: _iconColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lora'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              staggeredTileBuilder: (position) => const StaggeredTile.fit(2),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 16,
              ),
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
