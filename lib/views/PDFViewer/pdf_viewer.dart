import 'dart:io';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/widgets/input_appbar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../color_themes.dart';

class PDFViewerPage extends StatefulWidget {
  final File file;

  const PDFViewerPage({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  bool _loading = true;
  late PDFDocument _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    final _doc = await PDFDocument.fromFile(widget.file);

    setState(() {
      _document = _doc;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _title = basename(widget.file.path);
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      final _themeMode = themeNotifier.isDark ? darkMode : lightMode;
      final _cardColor = themeNotifier.isDark ? darkCardColor : lightCardColor;
      final _fontColor = themeNotifier.isDark ? darkFontColor : lightFontColor;
      final _iconColor =
          themeNotifier.isDark ? darkModeIconColor : lightModeIconColor;
      return _loading
          ? Center(
              child: SpinKitCircle(
                color: _iconColor,
              ),
            )
          : Scaffold(
              backgroundColor: _themeMode,
              appBar:
                  inputAppBar(themeNotifier, _cardColor, _fontColor, _title),
              body: PDFViewer(
                document: _document,
                scrollDirection: Axis.vertical,
                indicatorPosition: IndicatorPosition.topLeft,
                indicatorBackground: _iconColor,
                pickerIconColor: _themeMode,
                pickerButtonColor: _iconColor,
                indicatorText: _themeMode,
              ));
    });
  }
}
