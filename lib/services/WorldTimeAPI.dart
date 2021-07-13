import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTimeAPI {
  late String location;
  late String time;
  late String flag;
  late String url;

  WorldTimeAPI({required this.location, required this.flag, required this.url});

  Future<void> getTime() async{

    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Manila'));

      Map responseData = jsonDecode(response.body);
    }
  }
}
