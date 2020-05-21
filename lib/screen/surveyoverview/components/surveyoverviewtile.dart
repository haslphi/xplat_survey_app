import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/survey.dart';
import 'package:xplatsurveydemo/screen/surveyoverview/components/surveyoverviewdesciption.dart';
import 'package:xplatsurveydemo/screen/surveyoverview/components/surveyoverviewicon.dart';
import 'package:xplatsurveydemo/service/navigation.dart';

class SurveyOverviewTile extends StatelessWidget {
  SurveyOverviewTile({@required this.survey, @required this.index});

  final Survey survey;
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
      onPressed: () => openSurveyDetailsPage(context, survey.id, survey.title, colorMap[survey.id % colorMap.length]),
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
                child: Center(child: SurveyOverviewIcon(id: survey.id, backgroundColor: colorMap[survey.id % colorMap.length],)),
              ),
              Expanded(
                flex: 5,
                child: SurveyOverviewDescription(survey: survey,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
