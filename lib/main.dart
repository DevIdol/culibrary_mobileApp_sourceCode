import 'package:culibrary/database/database.dart';
import 'package:culibrary/provider/theme_provider.dart';
import 'package:culibrary/screens/loading_screen.dart';
import 'package:culibrary/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'provider/conectivity_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const LoadingScreen();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ThemeModel(),
              ),
              ChangeNotifierProvider<ConnectivityProvider>(
                create: (_) => ConnectivityProvider(),
              )
            ],
            child:
                Consumer(builder: (context, ThemeModel themeNotifier, child) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'CU LIBRARY',
                theme:
                    themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
                home: FutureBuilder<MyDatabase>(
                  future:
                      $FloorMyDatabase.databaseBuilder('mydatabase.db').build(),
                  builder: (context, data) {
                    if (data.hasData) {
                      Get.put(data.data!.monDao);
                      Get.put(data.data!.tueDao);
                      Get.put(data.data!.wedDao);
                      Get.put(data.data!.thuDao);
                      Get.put(data.data!.friDao);
                      Get.put(data.data!.subDao);
                      Get.put(data.data!.noteDao);
                      Get.put(data.data!.examDao);
                      return const SplashScreen();
                    } else if (data.hasError) {
                      return const LoadingScreen();
                    } else {
                      return const LoadingScreen();
                    }
                  },
                ),
              );
            }),
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
