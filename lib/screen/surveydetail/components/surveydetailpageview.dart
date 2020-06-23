import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/screen/question/questiontypedispatcher.dart';

class SurveyDetailsPageView extends StatefulWidget {
  SurveyDetailsPageView({this.surveyDetail, this.pageIndex});

  final SurveyDetail surveyDetail;
  final int pageIndex;

  @override
  _SurveyDetailsPageViewState createState() => _SurveyDetailsPageViewState();
}

class _SurveyDetailsPageViewState extends State<SurveyDetailsPageView> {
  PageController controller;

  final Map<int, Color> colorMap = {
    0: Colors.red,
    1: Colors.orange,
    2: Colors.yellow,
    3: Colors.green,
    4: Colors.blue,
  };

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: widget.pageIndex);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller,
        itemCount: widget.surveyDetail.questions.length,
        itemBuilder: (context, index) {
          return generateAnswerByType(surveyDetail: widget.surveyDetail, index: index, controller: controller);
        });
  }
}
