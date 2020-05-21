import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/survey.dart';
import 'package:xplatsurveydemo/restClient/surveyRestClient.dart';
import 'package:xplatsurveydemo/screen/surveyoverview/components/surveyoverviewtile.dart';
import 'package:xplatsurveydemo/service/const.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('This is a list of all available surveys'));
bool _defaultFilter(Survey survey) => true;

class SurveyOverviewScreen extends StatefulWidget {
  // default values target "All Survey" list
  SurveyOverviewScreen({Key key, this.filter = _defaultFilter, this.iconData = Icons.list, this.iconTag = surveyOverviewIconTag}) : super(key: key);

  final bool Function(Survey) filter;
  final IconData iconData;
  final String iconTag;

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
            Hero(
              tag: widget.iconTag,
              child: Icon(
                widget.iconData,
              ),
            ),
            Spacer(),
            const Text(PT_SURVEY_LIST),
            Spacer(flex: 5,),
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
                  List<Survey> surveys = (surveySnap.data as List<Survey>).where((element) => widget.filter(element)).toList();
                  return ListView.builder(
                    itemExtent: 125,
                    itemCount: surveys.length,
                    itemBuilder: (context, index) {
                      Survey survey = surveys[index];
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