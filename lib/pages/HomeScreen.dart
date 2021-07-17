import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/res/ColorsUsed.dart';
import 'package:worldtime/res/TextStyles.dart';
import 'package:worldtime/pages/DrawerHeader.dart';
import 'package:worldtime/services/WorldTimeAPI.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer timerer = Timer.periodic(Duration(seconds: 10), (timer) {});
  Map dataPassed = {};

  List<WorldTimeAPI> tiles = [
    WorldTimeAPI(location: 'Canada', url: 'America/Vancouver'),
    WorldTimeAPI(location: 'Egypt', url: 'Africa/Cairo'),
    WorldTimeAPI(location: 'England', url: 'Europe/London'),
    WorldTimeAPI(location: 'France', url: 'Europe/Paris'),
    WorldTimeAPI(location: 'Japan', url: 'Asia/Tokyo'),
    WorldTimeAPI(location: 'Korea', url: 'Asia/Seoul'),
    WorldTimeAPI(location: 'Netherlands', url: 'Europe/Amsterdam'),
    WorldTimeAPI(location: 'Philippines', url: 'Asia/Manila'),
    WorldTimeAPI(location: 'United Arab Emirates', url: 'Asia/Dubai'),
  ];

  void UpdateTime(index) async {
    WorldTimeAPI WorldTimeUpdate = tiles[index];
    await WorldTimeUpdate.getTime();

    // Timer.periodic(Duration(seconds: 1), (timer) async {
    // });

    Navigator.pop(context);

    timerer = new Timer.periodic(Duration(seconds: 1), (timer) {
      WorldTimeUpdate.getTime();
      setState(() {
        dataPassed['dateNow'] = WorldTimeUpdate.dateNow;
        dataPassed['weekday'] = WorldTimeUpdate.weekday;
        dataPassed['timeNow12'] = WorldTimeUpdate.timeNow12;
        dataPassed['timeNow24'] = WorldTimeUpdate.timeNow24;
        dataPassed['timezone'] = WorldTimeUpdate.timezone;
        dataPassed['dayOfWeek'] = WorldTimeUpdate.dayOfWeek;
        dataPassed['weekNumber'] = WorldTimeUpdate.weekNumber;
        dataPassed['dayOfYear'] = WorldTimeUpdate.dayOfYear;

        print(dataPassed['timeNow24']);
      });
    });
  }

  void Sammi() {
    Navigator.pop(context);
    setState(() {
      dataPassed['dateNow'] = 'From hamruru';
      dataPassed['weekday'] = 'hi sammimi';
      dataPassed['timeNow12'] = 'labyu <3';
      dataPassed['timeNow24'] = '00:00';
      dataPassed['timezone'] = '-------';
      dataPassed['dayOfWeek'] = "HEHE";
      dataPassed['weekNumber'] = "ENGE";
      dataPassed['dayOfYear'] = "KITH";
    });
  }

  // void UpdateTTime() {
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     UpdateTime(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    dataPassed = dataPassed.isNotEmpty
        ? dataPassed
        : ModalRoute.of(context)!.settings.arguments as Map;
    return Stack(
      children: [
        Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover))),
        Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            brightness: Brightness.dark,
            backgroundColor: Colors.transparent,
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
            child: Container(
              color: ColorsUsed.secondary,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeaders(),
                  Container(
                    // alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 8),
                    height: MediaQuery.of(context).size.height / 25,
                    child: ListTile(
                      onTap: () {
                        if (timerer.isActive == true) {
                          timerer.cancel();
                          Sammi();
                        } else {
                          Sammi();
                        }
                      },
                      leading: Icon(
                        CupertinoIcons.heart_circle,
                        color: ColorsUsed.primary,
                        size: 35,
                      ),
                      title: Text(
                        'Sammi',
                        style: DrawerBodyTextStyle,
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.black,
                    height: double.maxFinite,
                    padding: EdgeInsets.only(left: 20, right: 20, top: 0),
                    child: ListView.builder(
                      itemCount: tiles.length,
                      itemExtent: 50,
                      itemBuilder: (context, index) {
                        return Container(
                          // padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                          // color: Colors.black,
                          child: ListTile(
                            onTap: () {
                              if (timerer.isActive == true) {
                                timerer.cancel();
                                UpdateTime(index);
                              } else {
                                UpdateTime(index);
                              }
                            },
                            leading: Icon(
                              CupertinoIcons.location,
                              color: ColorsUsed.primary,
                              size: 35,
                            ),
                            title: Text(
                              tiles[index].location,
                              style: DrawerBodyTextStyle,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // DrawerBody(),
                ],
              ),
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
                      horizontal:
                          BorderSide(width: 1, color: ColorsUsed.primary)),
                ),
              ),
            ],
          ),
        ),
      ],
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

// class DrawerBody extends StatefulWidget {
//   const DrawerBody({Key? key}) : super(key: key);

//   @override
//   _DrawerBodyState createState() => _DrawerBodyState();
// }

// class _DrawerBodyState extends State<DrawerBody> {
//   List<WorldTimeAPI> tiles = [
//     WorldTimeAPI(location: 'Canada', url: 'America/Vancouver'),
//     WorldTimeAPI(location: 'Egypt', url: 'Africa/Cairo'),
//     WorldTimeAPI(location: 'England', url: 'Europe/London'),
//     WorldTimeAPI(location: 'France', url: 'Europe/Paris'),
//     WorldTimeAPI(location: 'Japan', url: 'Asia/Tokyo'),
//     WorldTimeAPI(location: 'Korea', url: 'Asia/Seoul'),
//     WorldTimeAPI(location: 'Netherlands', url: 'Europe/Amsterdam'),
//     WorldTimeAPI(location: 'Philippines', url: 'Asia/Manila'),
//     WorldTimeAPI(location: 'United Arab Emirates', url: 'Asia/Dubai'),
//   ];

//   void UpdateTime(index) async {
//     WorldTimeAPI WorldTimeUpdate = tiles[index];
//     await WorldTimeUpdate.getTime();

//     Navigator.pop(context, {
//       'dateNow': WorldTimeUpdate.dateNow,
//       'weekday': WorldTimeUpdate.weekday,
//       'timeNow12': WorldTimeUpdate.timeNow12,
//       'timeNow24': WorldTimeUpdate.timeNow24,
//       'timezone': WorldTimeUpdate.timezone,
//       'dayOfWeek': WorldTimeUpdate.dayOfWeek,
//       'weekNumber': WorldTimeUpdate.weekNumber,
//       'dayOfYear': WorldTimeUpdate.dayOfYear,
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: double.maxFinite,
//       padding: EdgeInsets.only(left: 20, right: 20, top: 5),
//       child: ListView.builder(
//         itemCount: tiles.length,
//         itemExtent: 50,
//         itemBuilder: (context, index) {
//           return Container(
//             child: ListTile(
//               onTap: () {
//                 UpdateTime(index);
//               },
//               leading: Icon(
//                 CupertinoIcons.location,
//                 color: ColorsUsed.primary,
//                 size: 35,
//               ),
//               title: Text(
//                 tiles[index].location,
//                 style: DrawerBodyTextStyle,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
