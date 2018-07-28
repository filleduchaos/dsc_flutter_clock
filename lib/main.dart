import 'package:flutter/material.dart';
import './services/time.dart';
import './views/clock_page.dart';

void main() {
  TimeService.start();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClockPage(),
    );
  }
}
