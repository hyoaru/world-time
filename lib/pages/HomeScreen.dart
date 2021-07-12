import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:worldtime/res/ColorsUsed.dart';
import 'package:worldtime/res/TextStyles.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: ColorsUsed.primary,
        backgroundColor: Colors.white,
        // brightness: Brightness.dark,
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
                height: MediaQuery.of(context).size.height / 3.25,
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
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height / 7,
              // aspectRatio: 5.0,
              viewportFraction: 0.3,
              // enlargeCenterPage: true,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: ColorsUsed.secondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'text $i',
                          style: CarouselTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ));
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
