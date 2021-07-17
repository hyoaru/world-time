import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:worldtime/res/ColorsUsed.dart';
import 'package:worldtime/pages/PreloadingScreen.dart';
import 'package:worldtime/pages/HomeScreen.dart';
import 'package:worldtime/res/TextStyles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Montserrat',
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(
              title: AppBarTextStyle,
            ),
          ),
          // appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          primaryColor: ColorsUsed.secondary,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity),

      // home: PreLoadingScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => PreLoadingScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
