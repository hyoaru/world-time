import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  Map dataPassed = {};
  @override
  Widget build(BuildContext context) {
    dataPassed = dataPassed.isNotEmpty
        ? dataPassed
        : ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          dataPassed['dateNow'],
        ),
        titleSpacing: MediaQuery.of(context).size.width / 9,
        actions: [
          Container(
            // padding: EdgeInsets.all(7),
            // color: ColorsUsed.secondary,
            // decoration:
            // BoxDecoration(
            //   color: ColorsUsed.secondary,
            //   borderRadius: BorderRadius.circular(60),
            // ),
            child: Builder(builder: (BuildContext context) {
              return IconButton(
                  icon: Icon(
                    CupertinoIcons.location,
                    size: 21,
                    color: ColorsUsed.primary,
                  ),
                  onPressed: () {
                    return Scaffold.of(context).openEndDrawer();
                  });
            }),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 13,
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeaders(),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.1,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dataPassed['weekday'].toUpperCase(),
                        style: S1TextStyle,
                      ),
                      Container(
                        // color: Colors.lightBlueAccent,
                        margin: EdgeInsets.only(top: 3),
                        child: Text(
                          dataPassed['timeNow12'].toUpperCase(),
                          style: MainTextStyle,
                        ),
                      ),
                      Text(
                        dataPassed['timeNow24'].toUpperCase(),
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
                    alignment: Alignment.center,
                    child: Text(
                      'Timezone\nDetails',
                      textAlign: TextAlign.center,
                      style: BottomWidgetTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  // child: Container(color: Colors.black,),
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Flexible(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      dataPassed['timezone'],
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
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomWidgetReUse(
                  label: 'Ordinal Day of the Week',
                  value: dataPassed['dayOfWeek'],
                ),
                BottomWidgetReUse(
                  label: 'Ordinal Week Number',
                  value: dataPassed['weekNumber'],
                ),
                BottomWidgetReUse(
                  label: 'Ordinal Day of the Year',
                  value: dataPassed['dayOfYear'],
                ),
              ],
            ),
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
        ],
      ),
    );
  }
}

class BottomWidgetReUse extends StatelessWidget {
  final String label;
  final String value;

  BottomWidgetReUse({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 7,
              child: Container(
                child: Text(
                  '$label',
                  textAlign: TextAlign.center,
                  style: BottomWidgetBodyTextStyle,
                ),
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
                child: Text(
                  '$value',
                  textAlign: TextAlign.center,
                  style: BottomWidgetTextStyle,
                ),
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
