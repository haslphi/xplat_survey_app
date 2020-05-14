import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/model/survey.dart';

class SurveyOverviewDescription extends StatelessWidget {
  SurveyOverviewDescription({@required this.survey});

  final Survey survey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  survey.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.title.fontSize,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 2.0),),
                Text(
                  survey.desc,
//                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam volu',
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.body1.fontSize,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0),),
          Expanded(
            flex: 0,
            child: Text(
              'Questions: ${survey.noOfQuestions}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.body1.fontSize,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
