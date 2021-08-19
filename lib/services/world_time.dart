import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; // Location name for the UI
  late String time; // Time in that locaiton
  String flag; // Url to an asset flag icon
  String url; // Location url for api endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
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
    now = now
        .add(Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));

    // Set time property
    time = now.toString();
  }
}
