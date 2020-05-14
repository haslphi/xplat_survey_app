import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/screen/home/components/hometile.dart';
import 'package:xplatsurveydemo/service/const.dart';
import 'package:xplatsurveydemo/service/navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  final double btnSize = 72.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Survey Home'),
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: const EdgeInsets.all(8),
          childAspectRatio: 1,
          children: <Widget>[
            HomeTile(
              icon: Icons.add_alert,
              iconTag: newSurveyOverviewIconTag,
              tileTitle: pt_newSurveys,
              onPressed: () => openNewSurveysOverview(context),
            ),
            HomeTile(
              icon: Icons.list,
              iconTag: surveyOverviewIconTag,
              tileTitle: pt_surveyList,
              onPressed: () => openSurveyOverview(context),
            ),
            HomeTile(
              icon: Icons.play_circle_outline,
              iconTag: resumeSurveyIconTag,
              tileTitle: pt_resumeSurvey,
            ),
            HomeTile(
              icon: Icons.add_circle_outline,
              iconTag: addSurveyIconTag,
              tileTitle: pt_createSurvey,
              onPressed: () => openAddSurvey(context),
            ),
          ],
        ),
      ),
    );
  }
}
