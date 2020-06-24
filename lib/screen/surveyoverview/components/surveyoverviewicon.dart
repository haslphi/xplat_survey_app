import 'package:flutter/material.dart';

enum SurveyOverviewIconSize {
  SMALL,
  LARGE,
}

class SurveyOverviewIcon extends StatelessWidget {
  SurveyOverviewIcon({@required this.id, this.size = SurveyOverviewIconSize.LARGE, this.backgroundColor = Colors.white, this.indicateLocal = false});

  final int id;
  final SurveyOverviewIconSize size;
  final Color backgroundColor;
  final bool indicateLocal;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: backgroundColor,
          radius: size == SurveyOverviewIconSize.LARGE ? 35.0 : 17,
          child: Text(
            id.toString(),
            style: new TextStyle(
              fontFamily: 'RockSalt',
              fontSize: size == SurveyOverviewIconSize.LARGE ? 25.0 : 12,
            ),
          ),
        ),
        Text(
          indicateLocal ? 'local' : '',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            fontSize: Theme
                .of(context)
                .textTheme
                .headline6
                .fontSize,
            color: Colors.tealAccent,
          ),
        ),
      ],
    );
//    return CircleAvatar(
//      backgroundColor: backgroundColor,
//      radius: size == SurveyOverviewIconSize.LARGE ? 35.0 : 17,
//      child: Text(
//        id.toString(),
//        style: new TextStyle(
//          fontFamily: 'RockSalt',
//          fontSize: size == SurveyOverviewIconSize.LARGE ? 25.0 : 12,
//        ),
//      ),
//    );
  }
}
