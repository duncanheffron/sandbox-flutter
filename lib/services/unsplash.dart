import 'dart:convert';

import 'package:http/http.dart';

class UnsplashImage {
  String location; // Location name
  bool isDayTime; // Time of day
  late String dayOrNight;
  late String url; // Url of image

  UnsplashImage({required this.location, required this.isDayTime});

  Future<void> getImage() async {
    dayOrNight = isDayTime ? 'day' : 'night';

    try {
      Response response = await get(Uri.parse(
          'https://api.unsplash.com/photos/random/?client_id=GaoWn55Duk9ESp-6de10wDRCNxkaxU_sKfNB3z2xMnc&query=$location,$dayOrNight&orientation=portrait'));
      Map data = jsonDecode(response.body);
      url = data['urls']['full'].toString();
    } catch (err) {
      print('🔴 Caught an error: $err');
      url = 'Could not get time data';
    }
  }
}
