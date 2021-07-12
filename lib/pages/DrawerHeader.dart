import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/res/ColorsUsed.dart';
import 'package:worldtime/res/TextStyles.dart';

class DrawerHeaders extends StatefulWidget {
  const DrawerHeaders({Key? key}) : super(key: key);

  @override
  _DrawerHeaderState createState() => _DrawerHeaderState();
}

class _DrawerHeaderState extends State<DrawerHeaders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsUsed.secondary,
      height: MediaQuery.of(context).size.height / 4,
      width: double.infinity,
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(CupertinoIcons.add),
          )
        ],
      ),
    );
  }
}
