import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/model/surveyPaused.dart';
import 'package:xplatsurveydemo/restClient/surveyRestClient.dart' as REST;
import 'package:xplatsurveydemo/service/const.dart' as Const;
import 'package:xplatsurveydemo/service/navigation.dart' as Nav;
import 'package:xplatsurveydemo/service/persistence.dart';

class QuestionButtonBar extends StatelessWidget {
  QuestionButtonBar(
      {@required this.isFirst,
      @required this.isLast,
      @required this.surveyDetail,
      @required this.pageController,
      @required this.scaffoldKey});

  final bool isFirst;
  final bool isLast;
  final PageController pageController;
  final SurveyDetail surveyDetail;
  final GlobalKey<ScaffoldState> scaffoldKey;

  _createButtons(BuildContext context) {
    List<Widget> list = List<Widget>();

    list.add(OutlineButton(
      child: Text('Back'),
      onPressed: isFirst
          ? null
          : () => pageController.previousPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut),
      shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(20))),
    ));
    list.add(OutlineButton(
      child: Icon(Icons.pause),
      onPressed: () {
        Persistence.addSurveyPaused(SurveyPaused(
                surveyDetail: surveyDetail,
                pausedAtPageIndex: pageController.page))
            .then((value) => value
                ? Nav.popFromPause(context)
                : _showException('Survey could not be paused and saved'));
      },
      shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(20))),
    ));
    if (!isLast)
      list.add(OutlineButton(
        child: Text('Next'),
        onPressed: isLast
            ? null
            : () => pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut),
        shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ));
    if (isLast)
      list.add(FloatingActionButton.extended(
        icon: Icon(Icons.send),
        label: Text('Submit'),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          REST
              .submitSurvey(surveyDetail)
              .then(
                  (value) => value
                      ? Nav.popFromSubmit(context)
                      : _showException('Submit was not successfull'),
                  onError: (e) => _showException(e.toString()))
              .then((value) => Persistence.removeSurveyPaused(surveyDetail.id));
        },
        heroTag: Const.submitIconTag,
      ));
    return list;
  }

  _showException(String errorMessage) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(errorMessage),
      duration: Duration(seconds: 5),
      backgroundColor: Colors.red,
    ));
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
