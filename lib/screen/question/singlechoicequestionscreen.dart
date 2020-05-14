import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/question.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';

class SingleChoiceQuestion extends StatefulWidget {
  const SingleChoiceQuestion({@required this.surveyDetail, @required this.index, @required this.controller});

  final int index;
  final SurveyDetail surveyDetail;
  final PageController controller;

  @override
  _SingleChoiceQuestionState createState() => _SingleChoiceQuestionState();
}

class _SingleChoiceQuestionState extends State<SingleChoiceQuestion> {
  Question question;
  String _selected = "";
//  List<String> alternatives = new List();

  @override
  Widget build(BuildContext context) {
    question = widget.surveyDetail.questions[widget.index];
    //question.answers.map((a) => alternatives.add(a.value));

    List<Widget> createRows() {
      List<Widget> allRows = new List();

      for (int i = 0; i < question.answers.length; i++) {
        Widget w = RadioListTile<String>(
          title: Text(question.answers[i].answerText),
          value: question.answers[i].answerText,
          groupValue: _selected,
          onChanged: (String value) {
            setState(() {
              _selected = value;
            });
          },
        );
        allRows.add(w);
      }

      return allRows;
    }

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
                        children: createRows(),
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
