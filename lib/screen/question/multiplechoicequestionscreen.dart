import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/answer.dart';
import 'package:xplatsurveydemo/model/question.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/screen/question/components/questionButtonBar.dart';

class MultipleChoiceQuestion extends StatefulWidget {
  const MultipleChoiceQuestion({@required this.surveyDetail, @required this.index, @required this.controller, @required this.scaffoldKey});

  final int index;
  final SurveyDetail surveyDetail;
  final PageController controller;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  _MultipleChoiceQuestionState createState() => _MultipleChoiceQuestionState();
}

class _MultipleChoiceQuestionState extends State<MultipleChoiceQuestion> {
  Question question;

  @override
  Widget build(BuildContext context) {
    question = widget.surveyDetail.questions[widget.index];

    List<Widget> createRows() {
      List<Widget> allRows = new List();

      for (int i = 0; i < question.answers.length; i++) {
        Widget w = CheckboxListTile(
          title: Text(question.answers[i].answerText),
          value: _isSelected(question.answers[i]),
          onChanged: (bool value) {
            setState(() {
              _setSelected(question.answers[i], value);
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
            ),
            QuestionButtonBar(
              isFirst: 0 == widget.index,
              isLast: widget.surveyDetail.questions.length == widget.index+1,
              surveyDetail: widget.surveyDetail,
              pageController: widget.controller,
              scaffoldKey: widget.scaffoldKey,
            ),
          ],
        )
    );
  }

  _isSelected(Answer answer) {
    return answer.value == "true";
  }

  _setSelected(Answer answer, bool selected) {
    answer.value = selected ? "true" : "false";
  }
}
