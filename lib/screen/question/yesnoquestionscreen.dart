import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/question.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/screen/question/questiontypedispatcher.dart';

class YesNoQuestion extends StatefulWidget {
  const YesNoQuestion({@required this.surveyDetail, @required this.index, @required this.controller});

  final int index;
  final SurveyDetail surveyDetail;
  final PageController controller;

  @override
  _YesNoQuestionState createState() => _YesNoQuestionState();
}

class _YesNoQuestionState extends State<YesNoQuestion> {
  Question question;
  String _yesnoselected = "";
//  List<String> alternatives = new List<String>();

  @override
  Widget build(BuildContext context) {
    question = widget.surveyDetail.questions[widget.index];
    //question.answers.map((a) => alternatives.add(a.value));

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
                        RadioListTile<String>(
                          title: Text(question.answers[0].answerText),
                          value: question.answers[0].answerText,
                          groupValue: _yesnoselected,
                          onChanged: (String value) {
                            setState(() {
                              _yesnoselected = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: Text(question.answers[1].answerText),
                          value: question.answers[1].answerText,
                          groupValue: _yesnoselected,
                          onChanged: (String value) {
                            setState(() {
                              _yesnoselected = value;
                            });
                          },
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
  }
}
