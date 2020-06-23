import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/question.dart';
import 'package:xplatsurveydemo/model/questiontype.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/screen/question/multiplechoicequestionscreen.dart';
import 'package:xplatsurveydemo/screen/question/numberquestionscreen.dart';
import 'package:xplatsurveydemo/screen/question/openquestionscreen.dart';
import 'package:xplatsurveydemo/screen/question/ratingquestionscreen.dart';
import 'package:xplatsurveydemo/screen/question/singlechoicequestionscreen.dart';
import 'package:xplatsurveydemo/screen/question/yesnoquestionscreen.dart';

Widget generateAnswerByType({@required SurveyDetail surveyDetail, @required int index, @required PageController controller, @required GlobalKey<ScaffoldState> scaffoldKey}) {
  Widget result = Container();
  final Question question = surveyDetail.questions[index];

  switch(question.type) {
    case QuestionType.OPEN:
      result = OpenQuestion(surveyDetail: surveyDetail, index: index, controller: controller, scaffoldKey: scaffoldKey,);
      break;

    case QuestionType.SINGLE_CHOICE:
      result = SingleChoiceQuestion(surveyDetail: surveyDetail, index: index, controller: controller, scaffoldKey: scaffoldKey,);
      break;
    case QuestionType.MULTIPLE_CHOICE:
      result = MultipleChoiceQuestion(surveyDetail: surveyDetail, index: index, controller: controller, scaffoldKey: scaffoldKey,);
      break;
    case QuestionType.YES_NO:
        result = YesNoQuestion(surveyDetail: surveyDetail, index: index, controller: controller, scaffoldKey: scaffoldKey,);
      break;
    case QuestionType.NUMBER:
      result = NumberQuestion(surveyDetail: surveyDetail, index: index, controller: controller, scaffoldKey: scaffoldKey,);
      break;
    case QuestionType.RATING:
      result = RatingQuestion(surveyDetail: surveyDetail, index: index, controller: controller, scaffoldKey: scaffoldKey,);
      break;
  }

  return result;
}