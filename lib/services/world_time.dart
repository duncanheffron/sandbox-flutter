import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // Location name for the UI
  late String time; // Time in that locaiton
  String flag; // Url to an asset flag icon
  String url; // Location url for api endpoint
  late bool isDayTime; // True or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // Make the request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // Get properties from data
      String datetime = data['datetime'];
      String offset1 = data['utc_offset'].substring(1, 3);
      String offset2 = data['utc_offset'].substring(4, 6);

      // Create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(
          Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));

      // Set time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (err) {
      print('🔴 Caught an error: $err');
      time = 'Could not get time data';
    }
  }
}
