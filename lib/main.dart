import 'package:flutter/material.dart';
import 'package:sandbox_flutter_routing/pages/choose_location.dart';
import 'package:sandbox_flutter_routing/pages/home.dart';
import 'package:sandbox_flutter_routing/pages/loading.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
