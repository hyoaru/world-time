import 'package:flutter/material.dart';
import 'package:worldtime/res/ColorsUsed.dart';
import 'package:worldtime/pages/PreloadingScreen.dart';
import 'package:worldtime/pages/HomeScreen.dart';

void main() {runApp(MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: ColorsUsed.secondary,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
    
    home: HomeScreen(),
    // initialRoute: 'home',
    // routes: {
    //   '/': (context) => PreloadingScreen(),
    //   '/home': (context) => HomeScreen(),
    // },
    );
  }
}