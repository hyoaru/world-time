import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/res/ColorsUsed.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        // leadingWidth: 20,
        // title: Column(
        //   children: [
        //     Text(
        //       'Today is'.toUpperCase(),
        //       style: TextStyle(
        //         color: ColorsUsed.primary,
        //         // fontFamily: 'Montserrat',
        //         fontWeight: FontWeight.w900,
        //       ),
        //     ),
        //     // SizedBox(height: 20),
        //   ],
        // ),
        actions: [
          Icon(
            CupertinoIcons.location_north_fill,
            color: ColorsUsed.primary,
            ),
          SizedBox(width: 30),
        ],
      ),
    // body: ,
    );
  }
}