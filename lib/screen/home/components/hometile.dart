import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  HomeTile({this.icon, this.iconTag, this.onPressed, this.tileTitle, this.customColor});

  final IconData icon;
  final String iconTag;
  final double btnSize = 72.0;
  final Function onPressed;
  final String tileTitle;
  final Color customColor;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.all(10.0),
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  //color: Colors.white,
                  gradient: new LinearGradient(
                    colors: [Colors.white, Colors.white70],
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight,
                    tileMode: TileMode.clamp,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 2)
                    )
                  ]
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Hero(
                      tag: iconTag,
                      child: Icon(
                        icon,
                        size: btnSize,
                        color: customColor ?? Theme.of(context).primaryColor ,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      tileTitle,
                      style: TextStyle(
                        color: customColor ?? Theme.of(context).primaryColor,
                        fontFamily: Theme.of(context).textTheme.title.fontFamily,
                        fontSize: Theme.of(context).textTheme.title.fontSize,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
