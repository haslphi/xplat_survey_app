import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/screen/question/questiontypedispatcher.dart';

class SurveyDetailsPageView extends StatelessWidget {
  SurveyDetailsPageView({this.surveyDetail});

  final PageController controller = PageController();

  final SurveyDetail surveyDetail;
  final Map<int, Color> colorMap = {
    0: Colors.red,
    1: Colors.orange,
    2: Colors.yellow,
    3: Colors.green,
    4: Colors.blue,
  };

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller,
        itemCount: surveyDetail.questions.length,
        itemBuilder: (context, index) {
          return generateAnswerByType(surveyDetail: surveyDetail, index: index, controller: controller);
        });
  }
}
