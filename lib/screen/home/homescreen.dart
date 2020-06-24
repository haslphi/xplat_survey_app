import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/screen/home/components/hometile.dart';
import 'package:xplatsurveydemo/service/const.dart' as Const;
import 'package:xplatsurveydemo/service/navigation.dart' as Nav;
import 'package:xplatsurveydemo/service/persistence.dart';

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
              iconTag: Const.newSurveyOverviewIconTag,
              tileTitle: Const.PT_NEW_SURVEY,
              onPressed: () => Nav.openNewSurveysOverview(context, Const.newSurveyOverviewIconTag, Const.PT_NEW_SURVEY),
            ),
            HomeTile(
              icon: Icons.list,
              iconTag: Const.surveyOverviewIconTag,
              tileTitle: Const.PT_SURVEY_LIST,
              onPressed: () => Nav.openSurveyOverview(context),
            ),
            HomeTile(
              icon: Icons.folder_open,
              iconTag: Const.resumeSurveyIconTag,
              tileTitle: Const.PT_RESUME_SURVEY,
              onPressed: () => Nav.openResumeSurveyList(context),
            ),
//            HomeTile(
//              icon: Icons.add_circle_outline,
//              iconTag: Const.addSurveyIconTag,
//              tileTitle: Const.PT_CREATE_SURVEY,
//              onPressed: () => Nav.openAddSurvey(context),
//            ),
            HomeTile(
              icon: Icons.developer_mode,
              tileTitle: 'Reset Prefs',
              iconTag: 'devmode',
              onPressed: () => Persistence.clear(),
              customColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
