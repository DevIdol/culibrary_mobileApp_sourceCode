import 'package:culibrary/color_themes.dart';
import 'package:culibrary/provider/conectivity_provider.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/screens/no_internet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      final _iconColor =
          themeNotifier.isDark ? darkModeIconColor : lightModeIconColor;
      return Scaffold(
        backgroundColor: themeNotifier.isDark ? darkMode : lightMode,
        body: Consumer<ConnectivityProvider>(
          builder: (consumerContext, model, child) {
            if (model.isOnline != null) {
              return model.isOnline!
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SpinKitCircle(color: _iconColor, size: 50.0),
                                SizedBox(height: 20),
                                Text(
                                  'Connecting...',
                                  style: TextStyle(color: secondColor, fontFamily: 'Lora'),
                                ),
                              ],
                            )),
                        Positioned(
                            bottom: 60.0,
                            child: Text(
                              'Developed by DevIdol',
                              style:
                                  TextStyle(fontSize: 10, color: secondColor, fontFamily: 'Lora'),
                            ))
                      ],
                    )
                  : NoInternetScreen();
            }
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      );
    });
  }
}
