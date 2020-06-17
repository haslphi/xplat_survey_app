import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/answer.dart';
import 'package:xplatsurveydemo/model/question.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/screen/question/components/questionButtonBar.dart';

class YesNoQuestion extends StatefulWidget {
  const YesNoQuestion({@required this.surveyDetail, @required this.index, @required this.controller});

  final int index;
  final SurveyDetail surveyDetail;
  final PageController controller;

  @override
  _YesNoQuestionState createState() => _YesNoQuestionState(surveyDetail.questions[index]);
}

class _YesNoQuestionState extends State<YesNoQuestion> {
  Question _question;
  String _selected;

  _YesNoQuestionState(this._question) {
    _question = this._question;
    _selected = _getSelected();
  }

  @override
  Widget build(BuildContext context) {

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
                      children: <Widget>[
                        //Text(question.answers[0].toString())
                        RadioListTile<String>(
                          title: Text(_question.answers[0].answerText),
                          value: _question.answers[0].answerText,
                          groupValue: _selected,
                          onChanged: (String value) {
                            _updateSelected(value);
                            setState(() {
                              _selected = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: Text(_question.answers[1].answerText),
                          value: _question.answers[1].answerText,
                          groupValue: _selected,
                          onChanged: (String value) {
                            _updateSelected(value);
                            setState(() {
                              _selected = value;
                            });
                          },
                        ),
                      ],
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
