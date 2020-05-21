import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/screen/addsurvey/addsurveyscreen.dart';
import 'package:xplatsurveydemo/screen/surveydetail/components/surveydetailpageview.dart';
import 'package:xplatsurveydemo/screen/surveydetail/surveydetailscreen.dart';
import 'package:xplatsurveydemo/screen/surveyoverview/surveyoverviewscreen.dart';
import 'package:xplatsurveydemo/service/const.dart';
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
    builder: (BuildContext context) {
      return SurveyOverviewScreen();
    },
  ));
}

void openNewSurveysOverview(BuildContext context, String iconTag) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return SurveyOverviewScreen(
        filter: (survey) => (!Persistence.getStringList(SURVEYS_SEEN).contains(survey.id.toString())),
        iconData: Icons.add_alert,
        iconTag: iconTag,
      );
    },
  ));
}

void openAddSurvey(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return AddSurveyScreen();
    },
  ));
}
// todo: remove Scaffold creation from this helper class
void startSurvey(BuildContext context, SurveyDetail surveyDetail) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(surveyDetail.title),
        ),
        body: Center(
          child: SurveyDetailsPageView(surveyDetail: surveyDetail,),
        ),
      );
    },
  ));
}