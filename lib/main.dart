import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/screen/home/homescreen.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Survey App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: HomeScreen(),
    );
  }
}