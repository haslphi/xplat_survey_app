import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/surveyDetails.dart';
import 'package:xplatsurveydemo/restClient/surveyRestClient.dart';
import 'package:xplatsurveydemo/screen/surveydetail/components/surveydetaildescription.dart';
import 'package:xplatsurveydemo/screen/surveyoverview/components/surveyoverviewicon.dart';
import 'package:xplatsurveydemo/service/navigation.dart';
import 'package:xplatsurveydemo/service/persistence.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar =
    const SnackBar(content: Text('This is a list of all available surveys'));

/// This is the stateful widget that the main application instantiates.
class SurveyDetailScreen extends StatefulWidget {
  SurveyDetailScreen({Key key, this.surveyId, this.surveyTitle, this.backgroundColor = Colors.blue})
      : super(key: key);

  final int surveyId;
  final String surveyTitle;
  final Color backgroundColor;

  @override
  _SurveyDetailScreenState createState() => _SurveyDetailScreenState();
}

class _SurveyDetailScreenState extends State<SurveyDetailScreen> {
  Future<SurveyDetail> futureSurvey;
  SurveyDetail surveyDetail;

  @override
  void initState() {
    super.initState();
    futureSurvey = fetchSurveyById(widget.surveyId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(widget.surveyId.toString() + ' ' + widget.surveyTitle),
        title: Row(
          children: <Widget>[
            SurveyOverviewIcon(id: widget.surveyId, size: SurveyOverviewIconSize.SMALL, backgroundColor: widget.backgroundColor,),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0),),
            Expanded(
                flex: 1,
                child: Text(
                  widget.surveyTitle,
                  softWrap: false,
                  overflow: TextOverflow.fade,)
            ),
          ],
        ),
      ),
      body: Container(
              child: FutureBuilder(
                future: futureSurvey,
                builder: (context, surveySnap) {
                  if (surveySnap.hasData) {
                    surveyDetail = surveySnap.data;
                    Persistence.addSurveySeen(surveyDetail.id);
                    return SurveyDetailDescription(surveyDetail: surveyDetail, backgroundColor: widget.backgroundColor,);
                  } else if (surveySnap.hasError) {
                    return Text("${surveySnap.error}");
                  }
                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              )
          ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Start'),
        backgroundColor: Theme.of(context).primaryColor,
        icon: Icon(
          Icons.play_arrow
        ),
        onPressed: () => startSurvey(context, surveyDetail),
      ),
    );
  }
}
