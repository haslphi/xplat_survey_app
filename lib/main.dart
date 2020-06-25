import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/screen/home/homescreen.dart';
import 'package:xplatsurveydemo/service/persistence.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Survey App';

  @override
  Widget build(BuildContext context) {
    // init Persistence Singleton
    Persistence.init();

//    return MultiProvider(
//      providers: [
//        Provider(
//          create: (context) => SelectedSurveyModel,
//        )
//      ],
//      child: MaterialApp(
//        title: _title,
//        home: HomeScreen(),
//      ),
//    );

    return MaterialApp(
      title: _title,
      home: HomeScreen(),
    );
  }
}
