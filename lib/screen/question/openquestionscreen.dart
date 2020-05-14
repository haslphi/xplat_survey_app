import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';

class OpenQuestion extends StatelessWidget {
  OpenQuestion({@required this.surveyDetail, @required this.index, @required this.controller});

  final int index;
  final SurveyDetail surveyDetail;
  //Question question = surveyDetail.questions[0];
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
              Row(
                children: <Widget>[
                  Card(
                    child: Text(
                      surveyDetail.questions[index].questionText,
                      style: TextStyle(fontSize: 24),),
                  ),
                ]
              ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Enter your answer'
                  ),
                ),
              ]),
            ),
            FlatButton.icon(
                onPressed: null,
                icon: Icon(Icons.navigate_next, size: 40.0,),
                label: Text('Proceed', style: TextStyle(fontSize: 24),)
            ),
          ]
      ),
    );
  }
}
