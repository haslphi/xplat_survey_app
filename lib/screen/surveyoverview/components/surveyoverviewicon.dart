import 'package:flutter/material.dart';

enum SurveyOverviewIconSize {
  SMALL,
  LARGE,
}

class SurveyOverviewIcon extends StatelessWidget {
  SurveyOverviewIcon({@required this.id, this.size = SurveyOverviewIconSize.LARGE, this.backgroundColor = Colors.white});

  final int id;
  final SurveyOverviewIconSize size;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: size == SurveyOverviewIconSize.LARGE ? 35.0 : 17,
      child: Text(
        id.toString(),
        style: new TextStyle(
          fontFamily: 'RockSalt',
          fontSize: size == SurveyOverviewIconSize.LARGE ? 25.0 : 12,
        ),
      ),
    );
  }
}
