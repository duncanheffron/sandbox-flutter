import 'package:flutter/material.dart';
import 'package:sandbox_flutter_routing/services/world_time.dart';
import 'package:sandbox_flutter_routing/services/unsplash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      location: 'London',
      flag: 'uk.png',
      url: 'Europe/London',
    );
    await instance.getTime();
    UnsplashImage image = UnsplashImage(
      location: instance.location,
      isDayTime: instance.isDayTime,
    );
    await image.getImage();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'bgImage': image.url,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.black,
          size: 50.0,
        ),
      ),
    );
  }
}
