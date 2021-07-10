import 'package:flutter/material.dart';
import 'package:worldtime/res/colorsused.dart';

class PreloadingScreen extends StatefulWidget {
  const PreloadingScreen({ Key? key }) : super(key: key);

  @override
  _PreloadingScreenState createState() => _PreloadingScreenState();
}

class _PreloadingScreenState extends State<PreloadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUsed.secondary,
      body: Container(
        child: Text('location page'),
      ),
      
    );
  }
}