import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/question.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';

class OpenQuestion extends StatelessWidget {
  OpenQuestion({@required this.surveyDetail, @required this.index, @required this.controller});

  final int index;
  final SurveyDetail surveyDetail;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    Question question;
    question = surveyDetail.questions[index];

    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          question.questionText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //const Padding(padding: EdgeInsets.symmetric(vertical: 2.0),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          //Text(question.answers[0].toString())
//                          TextFormField(
//                            decoration: InputDecoration(
//                                labelText: 'Enter your answer'
//                            ),
//                          ),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          minLines: 5,
                          maxLines: 20,
                          decoration: InputDecoration(
                                labelText: 'Enter your answer'
                            ),
                        ),
                        ],
                      )
                  ),
                ],
              ),
            )
          ],
        )
    );
    /*return Container(
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
    );*/
  }
}
