import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/answer.dart';
import 'package:xplatsurveydemo/model/question.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/screen/question/components/questionButtonBar.dart';

class SingleChoiceQuestion extends StatefulWidget {
  const SingleChoiceQuestion({@required this.surveyDetail, @required this.index, @required this.controller});

  final int index;
  final SurveyDetail surveyDetail;
  final PageController controller;

  @override
  _SingleChoiceQuestionState createState() => _SingleChoiceQuestionState(surveyDetail.questions[index]);
}

class _SingleChoiceQuestionState extends State<SingleChoiceQuestion> {
  Question _question;
  String _selected;

  _SingleChoiceQuestionState(this._question) {
    _question = this._question;
    _selected = _getSelected();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _createRows() {
      List<Widget> allRows = new List();

      for (int i = 0; i < _question.answers.length; i++) {
        Widget w = RadioListTile<String>(
          title: Text(_question.answers[i].answerText),
          value: _question.answers[i].answerText,
          groupValue: _selected,
          onChanged: (String value) {
            _updateSelected(value);
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
                          _question.questionText,
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
                        children: _createRows(),
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
            ),
          ],
        )
    );
  }

  _updateSelected(String selected) {
    _question.answers.forEach((element) {element.answerText == selected ? element.value = "true" : element.value = "false";});
  }

  _getSelected() {
    return _question.answers.firstWhere((element) => element.value == "true", orElse: () => Answer(value: "")).answerText;
  }
}
