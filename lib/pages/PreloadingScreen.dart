import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/services/WorldTimeAPI.dart';
import 'package:worldtime/res/ColorsUsed.dart';

class PreLoadingScreen extends StatefulWidget {
  const PreLoadingScreen({Key? key}) : super(key: key);

  @override
  _PreLoadingScreenState createState() => _PreLoadingScreenState();
}

class _PreLoadingScreenState extends State<PreLoadingScreen> {
  void HomeScreenInitialize() async {
    // WorldTimeAPI WorldTimeInit =
    //     WorldTimeAPI(location: 'Philippines', url: 'Asia/Manila');

    Future.delayed(Duration(seconds: 4), () async {
      // await WorldTimeInit.getTime();
      // print(WorldTimeInit.dateNow);
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'dateNow': '---- -- ----',
        'weekday': 'choose your',
        'timeNow12': 'location',
        'timeNow24': '00:00',
        'timezone': '-------',
        'dayOfWeek': '0',
        'weekNumber': '0',
        'dayOfYear': '0',
      });
    });
  }

  @override
  void initState() {
    super.initState();
    HomeScreenInitialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUsed.secondary,
      appBar: AppBar(
        backgroundColor: ColorsUsed.secondary,
        elevation: 0.0,
        brightness: Brightness.dark,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: Center(
          child: SpinKitFadingFour(
            color: ColorsUsed.primary,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
