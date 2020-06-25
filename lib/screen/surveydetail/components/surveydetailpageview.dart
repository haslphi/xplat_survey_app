import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/screen/question/questiontypedispatcher.dart';

class SurveyDetailsPageView extends StatefulWidget {
  SurveyDetailsPageView(
      {@required this.surveyDetail,
      this.pageIndex = 0,
      @required this.scaffoldKey});

  final SurveyDetail surveyDetail;
  final int pageIndex;
  final GlobalKey<ScaffoldState> scaffoldKey;

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
          return generateAnswerByType(
              surveyDetail: widget.surveyDetail,
              index: index,
              controller: controller,
              scaffoldKey: widget.scaffoldKey);
        });
  }
}
