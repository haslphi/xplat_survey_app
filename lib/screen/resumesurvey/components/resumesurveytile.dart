import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/surveyPaused.dart';
import 'package:xplatsurveydemo/screen/resumesurvey/components/resumesurveydescription.dart';
import 'package:xplatsurveydemo/screen/surveyoverview/components/surveyoverviewicon.dart';
import 'package:xplatsurveydemo/service/navigation.dart' as Nav;

class ResumeSurveyListTile extends StatelessWidget {
  ResumeSurveyListTile({@required this.surveyPaused, @required this.index});

  final SurveyPaused surveyPaused;
  final int index;

  final Map<int, Color> colorMap = {
    0: Colors.lime,
    1: Colors.orange,
    2: Colors.lightGreen,
    3: Colors.redAccent,
    4: Colors.deepPurple,
  };

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      //padding: EdgeInsets.all(0.0),
      //padding: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.only(left: 12, top: 16, right: 12, bottom: 0),
//      onPressed: () => Nav.openSurveyDetailsPage(context, survey.id, survey.title, colorMap[survey.id % colorMap.length]),
      onPressed: () => Nav.startSurvey(context, SurveyPaused.fromJson(jsonDecode(jsonEncode(surveyPaused))).surveyDetail, pageIndex: surveyPaused.pausedAtPageIndex.toInt()),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 2)
              )
            ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Center(child: SurveyOverviewIcon(id: surveyPaused.surveyDetail.id, backgroundColor: colorMap[surveyPaused.surveyDetail.id % colorMap.length],)),
              ),
              Expanded(
                flex: 5,
                child: ResumeSurveyDescription(surveyDetail: surveyPaused.surveyDetail,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
