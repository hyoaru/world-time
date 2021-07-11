import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:worldtime/res/ColorsUsed.dart';
import 'package:worldtime/res/TextStyles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: ColorsUsed.primary,
        backgroundColor: Colors.white,
        // brightness: Brightness.light,
        elevation: 0,
        title: Text(
          'Date here',
        ),
        titleSpacing: 30,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.location,
              size: 25,
              color: ColorsUsed.primary,
            ),
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                // color: Colors.yellow,
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEDNESDAY'.toUpperCase(),
                      style: S1TextStyle,
                    ),
                    Container(
                      // color: Colors.lightBlueAccent,
                      margin: EdgeInsets.only(top: 3),
                      child: Text(
                        '12:00 AM',
                        style: MainTextStyle,
                      ),
                    ),
                    Text(
                      '00:00',
                      style: S2TextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
