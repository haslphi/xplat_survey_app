import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/survey.dart';
import 'package:xplatsurveydemo/restClient/surveyRestClient.dart';
import 'package:xplatsurveydemo/screen/surveyoverview/components/surveyoverviewtile.dart';
import 'package:xplatsurveydemo/service/const.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('This is a list of all available surveys'));

class SurveyOverviewScreen extends StatefulWidget {
  SurveyOverviewScreen({Key key}) : super(key: key);

  @override
  _SurveyOverviewScreenState createState() => _SurveyOverviewScreenState();
}

class _SurveyOverviewScreenState extends State<SurveyOverviewScreen> {
  Future<List<Survey>> futureSurveys;

  @override
  void initState() {
    super.initState();
    futureSurveys = fetchSurveys();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            const Text(pt_surveyList),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
            child: FutureBuilder(
              future: futureSurveys,
              builder: (context, surveySnap) {
                if (surveySnap.hasData) {
                  //return Text(snapshot.data.title);
                  return ListView.builder(
                    itemExtent: 125,
                    itemCount: surveySnap.data.length,
                    itemBuilder: (context, index) {
                      Survey survey = surveySnap.data[index];
                      return SurveyOverviewTile(survey: survey, index: index);
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