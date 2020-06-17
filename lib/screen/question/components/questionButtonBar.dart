import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/restClient/surveyRestClient.dart';
import 'package:xplatsurveydemo/service/const.dart';

class QuestionButtonBar extends StatelessWidget {
  QuestionButtonBar(
      {@required this.isFirst,
      @required this.isLast,
      @required this.surveyDetail,
      @required this.pageController});

  final bool isFirst;
  final bool isLast;
  final PageController pageController;
  final SurveyDetail surveyDetail;

  _createButtons(BuildContext context) {
    List<Widget> list = List<Widget>();

    list.add(IconButton(
      iconSize: 36,
      icon: Icon(Icons.navigate_before),
      onPressed: isFirst
          ? null
          : () => pageController.previousPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut),
    ));
    list.add(IconButton(
      iconSize: 36,
      icon: Icon(Icons.pause),
      onPressed: () => pageController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut),
    ));
    list.add(IconButton(
      iconSize: 36,
      icon: Icon(Icons.navigate_next),
      onPressed: isLast
          ? null
          : () => pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut),
    ));
    if (isLast)
      list.add(FloatingActionButton.extended(
        icon: Icon(Icons.send),
        label: Text('Submit'),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => submitSurvey(surveyDetail),
        heroTag: submitIconTag,
      ));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomRight,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: _createButtons(context),
        ),
      ),
    );
  }
}
