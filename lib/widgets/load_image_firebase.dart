import 'package:cached_network_image/cached_network_image.dart';
import 'package:culibrary/color_themes.dart';
import 'package:culibrary/provider/firebase_provider.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

Future<Widget> _getImage(BuildContext context, String imageName) async {
  CachedNetworkImage? image;
  await FirebaseStorageService.loadImage(context, imageName).then((value) {
    image = CachedNetworkImage(
      imageUrl: value.toString(),
      fit: BoxFit.scaleDown,
      placeholder: (context, url) =>
          Consumer(builder: (context, ThemeModel themeNotifier, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCircle(
              color:
                  themeNotifier.isDark ? darkModeIconColor : lightModeIconColor,
              size: 40,
            ),
            SizedBox(height: 8),
            Text(
              'Connecting...',
              style: TextStyle(fontSize: 8, color: secondColor),
            )
          ],
        );
      }),
      errorWidget: (context, url, error) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: secondColor),
          SizedBox(height: 8),
          Text(
            'Connection Failed!',
            style: TextStyle(fontSize: 8, color: secondColor),
          )
        ],
      ),
    );
  });
  return image!;
}

loadImageFromFirebase(context, tap, imageName, _iconColor) {
  return InkWell(
      onTap: tap,
      child: FutureBuilder(
        future: _getImage(context, imageName),
        builder: (context, dynamic data) {
          if (data.connectionState == ConnectionState.done) {
            return Consumer(
                builder: (context, ThemeModel themeNotifier, child) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.36,
                height: MediaQuery.of(context).size.height * 0.22,
                child: Card(
                  color: themeNotifier.isDark ? darkCardColor : lightCardColor,
                  elevation: 20,
                  shadowColor: themeNotifier.isDark
                      ? darkShawdowColor
                      : lightShawdowColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: secondColor, width: 0.4),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: data.data,
                ),
              );
            });
          } else if (data.connectionState == ConnectionState.waiting) {
            return Consumer(
                builder: (context, ThemeModel themeNotifier, child) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.36,
                height: MediaQuery.of(context).size.height * 0.22,
                child: Card(
                  color: themeNotifier.isDark ? darkCardColor : lightCardColor,
                  elevation: 20,
                  shadowColor: themeNotifier.isDark
                      ? darkShawdowColor
                      : lightShawdowColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: secondColor, width: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SpinKitCircle(
                        color: _iconColor,
                        size: 40,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Connecting...',
                        style: TextStyle(fontSize: 8, color: secondColor),
                      )
                    ],
                  ),
                ),
              );
            });
          } else {
            return LoadingScreen();
          }
        },
      ));
}
