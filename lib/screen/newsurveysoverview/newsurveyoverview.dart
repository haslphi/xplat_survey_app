import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/service/const.dart';

class NewSurveyOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text(pt_newSurveys),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Hero(
              tag: newSurveyOverviewIconTag,
              child: Icon(
                Icons.add_alert,
                size: heroIconSizeBig,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
