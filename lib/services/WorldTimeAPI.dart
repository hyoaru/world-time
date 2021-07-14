import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTimeAPI {
  late String url;
  late String location;
  late String weekday;
  late String timeNow12;
  late String timeNow24;
  late String dateNow;
  late String dayOfWeek;
  late String dayOfYear;
  late String weekNumber;
  late String timezone;

  WorldTimeAPI({required this.location, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      Map responseData = jsonDecode(response.body);
      String dateTime = responseData['datetime'];
      dayOfWeek = responseData['day_of_week'].toString();
      dayOfYear = responseData['day_of_year'].toString();
      weekNumber = responseData['week_number'].toString();
      timezone = responseData['timezone'];

      String offset = responseData['utc_offset'].substring(1, 3);

      DateTime timeNow = DateTime.parse(dateTime);
      timeNow = timeNow.add(Duration(hours: int.parse(offset)));

      timeNow24 = DateFormat.Hm().format(timeNow);
      timeNow12 = DateFormat.jm().format(timeNow);
      weekday = DateFormat.EEEE().format(timeNow);
      dateNow = DateFormat.yMMMd().format(timeNow);
      // print(responseData);
    } catch (e) {
      print(e);
      weekday = 'could not';
      timeNow12 = 'get time';
      timeNow24 = '00:00';
      dateNow = '---- -- ----';
      dayOfWeek = '0';
      dayOfYear = '0';
      weekNumber = '0';
      timezone = '--------';
    }
  }
}
