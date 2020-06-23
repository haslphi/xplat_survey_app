import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/screen/addsurvey/addsurveyscreen.dart';
import 'package:xplatsurveydemo/screen/resumesurvey/resumesurveylist.dart';
import 'package:xplatsurveydemo/screen/surveydetail/components/surveydetailpageview.dart';
import 'package:xplatsurveydemo/screen/surveydetail/surveydetailscreen.dart';
import 'package:xplatsurveydemo/screen/surveyoverview/surveyoverviewscreen.dart';
import 'package:xplatsurveydemo/service/const.dart' as Const;
import 'package:xplatsurveydemo/service/persistence.dart';

void openAppBarPage(BuildContext context, String surveyJson) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Next page'),
        ),
        body: Center(
          child: Text(
            surveyJson,
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    },
  ));
}

void openSurveyDetailsPage(BuildContext context, int id, String surveyTitle, Color backgroundColor) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return SurveyDetailScreen(surveyId: id, surveyTitle: surveyTitle, backgroundColor: backgroundColor,);
    },
  ));
}

void openSurveyOverview(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) => SurveyOverviewScreen(),
  ));
}

void openResumeSurveyList(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) => ResumeSurveyList(),
  ));
}

void openNewSurveysOverview(BuildContext context, String iconTag, String title) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return SurveyOverviewScreen(
        filter: (survey) => (!Persistence.getStringList(Const.SURVEYS_SEEN).contains(survey.id.toString())),
        iconData: Icons.add_alert,
        iconTag: iconTag,
        title: title,
      );
    },
  ));
}

void openAddSurvey(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) => AddSurveyScreen(),
  ));
}
// todo: remove Scaffold creation from this helper class
void startSurvey(BuildContext context, SurveyDetail surveyDetail, {int pageIndex}) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(surveyDetail.title),
        ),
        body: Center(
          child: SurveyDetailsPageView(surveyDetail: surveyDetail, pageIndex: pageIndex, scaffoldKey: _scaffoldKey,),
        ),
      );
    },
  ));
}

void popFromSubmit(BuildContext context) {
  Navigator.pop(context);
  Navigator.pop(context);
}

void popFromPause(BuildContext context) {
  Navigator.pop(context);
  Navigator.pop(context);
}