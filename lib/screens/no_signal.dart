import 'package:culibrary/api/text_api.dart';
import 'package:culibrary/color_themes.dart';
import 'package:culibrary/provider/conectivity_provider.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

noSignal(context) {
  return Consumer(builder: (context, ThemeModel themeNotifier, child) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.36,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        color: themeNotifier.isDark ? darkCardColor : lightCardColor,
        elevation: 10,
        shadowColor:
            themeNotifier.isDark ? darkShawdowColor : lightShawdowColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: secondColor, width: 0.2),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off,
              color: secondColor,
            ),
            SizedBox(height: 8),
            Text(
              'No Internet Connection!',
              style: TextStyle(
                  fontSize: 8, color: secondColor, fontFamily: fontStyle),
            )
          ],
        ),
      ),
    );
  });
}

noConnection(context, function, _iconColor, name) {
  return Column(
    children: [
      Consumer<ConnectivityProvider>(
        builder: (consumerContext, model, child) {
          if (model.isOnline != null) {
            return model.isOnline! ? function : noSignal(context);
          }
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
      SizedBox(height: 10),
      Text(
        name,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: _iconColor,
            fontFamily: fontStyle),
      ),
    ],
  );
}
