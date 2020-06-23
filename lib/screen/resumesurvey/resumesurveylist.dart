import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/survey.dart';
import 'package:xplatsurveydemo/model/surveyPaused.dart';
import 'package:xplatsurveydemo/restClient/surveyRestClient.dart' as REST;
import 'package:xplatsurveydemo/screen/resumesurvey/components/resumesurveytile.dart';
import 'package:xplatsurveydemo/service/const.dart' as Const;
import 'package:xplatsurveydemo/service/persistence.dart';

class ResumeSurveyList extends StatefulWidget {
  ResumeSurveyList({Key key,}) : super(key: key);


  @override
  _ResumeSurveyListState createState() => _ResumeSurveyListState();
}

class _ResumeSurveyListState extends State<ResumeSurveyList> {
  Future<List<Survey>> futureSurveys;

  @override
  void initState() {
    super.initState();
    futureSurveys = REST.fetchSurveys();
  }

  SurveyPaused _mapToSurveyPaused(Survey survey) {
    return Persistence.getSurveyPaused(survey.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Hero(
              tag: Const.resumeSurveyIconTag,
              child: Icon(Icons.folder_open),
            ),
            Spacer(),
            Text(Const.PT_RESUME_SURVEY),
            Spacer(flex: 5,),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
            child: FutureBuilder(
              future: futureSurveys,
              builder: (context, surveySnap) {
                if (surveySnap.hasData) {
                  List<SurveyPaused> surveysPaused = (surveySnap.data as List<Survey>).map((survey) => _mapToSurveyPaused(survey)).toList().where((sp) => sp != null).toList();
                  return ListView.builder(
                    itemExtent: 125,
                    itemCount: surveysPaused.length,
                    itemBuilder: (context, index) {
                      SurveyPaused surveyPaused = surveysPaused[index];
                      return ResumeSurveyListTile(surveyPaused: surveyPaused, index: index);
                    },
                  );
                } else if (surveySnap.hasError) {
                  return Text("${surveySnap.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            )
        ),
      ),
    );
  }

}