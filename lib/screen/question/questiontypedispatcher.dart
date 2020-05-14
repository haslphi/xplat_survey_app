import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/question.dart';
import 'package:xplatsurveydemo/model/questiontype.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/screen/question/openquestionscreen.dart';

enum RadioOptions { Option1, Option2, Option3 }

RadioOptions _character = RadioOptions.Option1;

Widget generateAnswerByType({@required SurveyDetail surveyDetail, @required int index, @required PageController controller}) {
  Widget result = Container();
  final Question question = surveyDetail.questions[index];

  switch(question.type) {
    case QuestionType.OPEN:
      result = OpenQuestion(surveyDetail: surveyDetail, index: index, controller: controller);
      break;

    case QuestionType.SINGLE_CHOICE:
      result = Container(child: Center(child: Text(question.questionText, style: TextStyle(fontSize: 24),)),);

      result = Column(
        children: <Widget>[
          Container(child: Center(child: Text(question.questionText, style: TextStyle(fontSize: 24),)),),
          RadioListTile<RadioOptions>(
              title: const Text('Option1'),
            value: RadioOptions.Option1,
            groupValue: _character,
          ),
          RadioListTile<RadioOptions>(
            title: const Text('Option2'),
            value: RadioOptions.Option2,
            groupValue: _character,
          ),
          RadioListTile<RadioOptions>(
            title: const Text('Option3'),
            value: RadioOptions.Option3,
            groupValue: _character,
          ),
          FlatButton.icon(
              onPressed: null,
              icon: Icon(Icons.navigate_next, size: 40.0,),
              label: Text(surveyDetail.questions.length == index +1 ? 'Proceed' : 'Complete', style: TextStyle(fontSize: 24),)
          ),
        ],
      );
      break;
    case QuestionType.MULTIPLE_CHOICE:
      result = Container(child: Center(child: Text(question.questionText, style: TextStyle(fontSize: 24),)),);
      break;
    case QuestionType.YES_NO:
      result = Container(child: Center(child: Text(question.questionText, style: TextStyle(fontSize: 24),)),);
      break;
    case QuestionType.NUMBER:
      result = Container(child: Center(child: Text(question.questionText, style: TextStyle(fontSize: 24),)),);
      break;
    case QuestionType.RATING:
      result = Container(child: Center(child: Text(question.questionText, style: TextStyle(fontSize: 24),)),);
      break;
  }

  return result;
}