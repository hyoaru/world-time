import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/res/ColorsUsed.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Date here'),
        titleSpacing: 30,
        actions: [
          Icon(CupertinoIcons.location, size: 30, color: ColorsUsed.primary,),
          SizedBox(width: 30,),
          
        ],
        
      ),
    );
  }
}