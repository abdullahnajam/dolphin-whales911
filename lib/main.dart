import 'package:dolphinwhale/screen/splash.dart';
import 'package:dolphinwhale/screen/user_view_reports.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dolphin & Whales 911',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}

