import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:worldtime/res/ColorsUsed.dart';
import 'package:worldtime/res/TextStyles.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:worldtime/pages/DrawerHeader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var scaffoldKey = GlobalKey<ScaffoldState>();
  // final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        // backgroundColor: ColorsUsed.primary,
        backgroundColor: Colors.white,
        // brightness: Brightness.dark,
        elevation: 0,
        title: Text(
          'Date here',
        ),
        titleSpacing: MediaQuery.of(context).size.width / 9,
        actions: [
          Builder(builder: (BuildContext context) {
            return IconButton(
                icon: Icon(
                  CupertinoIcons.location,
                  size: 25,
                  color: ColorsUsed.primary,
                ),
                onPressed: () {
                  return Scaffold.of(context).openEndDrawer();
                });
          }),
          SizedBox(
            width: MediaQuery.of(context).size.width / 13,
          ),
        ],
      ),
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                DrawerHeaders(),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // alignment: Alignment.topCenter,
                // color: Colors.yellow,
                height: MediaQuery.of(context).size.height / 2.1,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
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
              ),
            ],
          ),
          Container(
            child: Row(
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
                    // color: ColorsUsed.primary,
                    child: Text(
                      'Timezone Details',
                      textAlign: TextAlign.center,
                      style: BottomWidgetTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  // child: Container(color: Colors.amber),
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Flexible(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Asia/Manila',
                      textAlign: TextAlign.center,
                      style: BottomWidgetTextStyle,
                    ),
                  ),
                ),
              ],
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 9),
            padding: EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height / 9,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: ColorsUsed.secondary,
              // border: Border.all(width: .5, color: ColorsUsed.primary),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomWidgetReUse(),
                BottomWidgetReUse(),
                BottomWidgetReUse(),
              ],
            ),
            // alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 9,
              vertical: MediaQuery.of(context).size.height / 26.5,
            ),
            height: MediaQuery.of(context).size.height / 6,
            decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(width: .5, color: ColorsUsed.primary)),
            ),
          ),
          // CarouselSlider(
          //   options: CarouselOptions(
          //     height: MediaQuery.of(context).size.height / 5,
          //     // aspectRatio: 5.0,
          //     viewportFraction: 0.6,
          //     enlargeCenterPage: true,
          //   ),
          //   items: [
          //     1,
          //     2,
          //     3,
          //   ].map((i) {
          //     return Builder(
          //       builder: (BuildContext context) {
          //         return Container(
          //             padding: EdgeInsets.all(15),
          //             width: MediaQuery.of(context).size.width,
          //             margin: EdgeInsets.symmetric(horizontal: 5.0),
          //             decoration: BoxDecoration(
          //               color: ColorsUsed.secondary,
          //               borderRadius: BorderRadius.circular(20),
          //             ),
          //             child: Row(
          //               // mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Flexible(
          //                   flex: 7,
          //                   child: Container(
          //                     // color: Colors.amber,
          //                     // // alignment: Alignment.center,
          //                     child: Text(
          //                       'textasdasdsadasdadasdasdasdadfsdfsdfsdfsdfsd',
          //                       style: CarouselTextStyle,
          //                       // textAlign: TextAlign.center,
          //                     ),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: MediaQuery.of(context).size.width / 30,
          //                 ),
          //                 Flexible(
          //                   flex: 3,
          //                   child: Container(
          //                     // width: MediaQuery.of(context).size.width,
          //                     alignment: Alignment.center,
          //                     child: Text(
          //                       '500',
          //                       style: CarouselTextStyle,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ));
          //       },
          //     );
          //   }).toList(),
          // )
        ],
      ),
    );
  }
}

class BottomWidgetReUse extends StatelessWidget {
  const BottomWidgetReUse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 7,
              child: Container(
                // alignment: Alignment.center,
                child: Text(
                  'Ordinal day of the year',
                  textAlign: TextAlign.center,
                  style: BottomWidgetBodyTextStyle,
                ),
                // color: Colors.black,
              ),
            ),
            SizedBox(
              child: Container(
                  // color: Colors.black,
                  ),
              height: MediaQuery.of(context).size.height / 60,
            ),
            Flexible(
              flex: 3,
              child: Container(
                // alignment: Alignment.topCenter,
                child: Text(
                  '200',
                  textAlign: TextAlign.center,
                  style: BottomWidgetTextStyle,
                ),
                // color: Colors.black,
              ),
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height / 6,
        // decoration: BoxDecoration(
        //   // color: ColorsUsed.secondary,
        //   border: Border.all(width: 1, color: ColorsUsed.primary),
        //   borderRadius: BorderRadius.circular(20),
        // ),
      ),
    );
  }
}
