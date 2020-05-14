import 'package:flutter/material.dart';
import 'package:xplatsurveydemo/service/const.dart';

class AddSurveyScreen extends StatelessWidget {

  final Map<int, Color> colorMap = {
    0: Colors.red,
    1: Colors.orange,
    2: Colors.yellow,
    3: Colors.green,
    4: Colors.blue,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text(pt_createSurvey),
          ],
        ),
      ),
      body: PageView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              color: colorMap[index % colorMap.length],
              child: Column(
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: addSurveyIconTag,
                      child: Icon(
                        Icons.add_circle_outline,
                        size: heroIconSizeBig,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                  Center(
                    child: Text('Page ' + index.toString()),
                  ),
                ]
              ),
            );
        }),
      /*SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Hero(
                  tag: addSurveyIconTag,
                  child: Icon(
                    Icons.add_circle_outline,
                    size: heroIconSizeBig,
                    color: Colors.lightGreen,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),*/
    );
  }
}