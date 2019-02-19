import 'package:flutter/material.dart';
import 'package:boating_app/preferences.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();

class ScoreDisplay extends StatelessWidget {   //page that displays score to user once evaluated
  const ScoreDisplay({Key key,  this.scoreReport, this.onTap}) : super(key: key);
  final VoidCallback onTap;
  final ScoreReport scoreReport;

  Widget _buildSubScorePanel ()  {
    TextStyle _titleTextStyle = TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold);
    TextStyle _subScoreTextStyle = TextStyle(color: Colors.black, fontSize: 14);

    return  (
    Column(

      children: <Widget>[
        Text(
          "Sub-Scores",
          style: _titleTextStyle,

        ),
        Container(
          child: Divider(
          color: Colors.black,
          height: 4,
        ),
          width: 120,
          height: 8,
        ),
        Text(
          "Temperature - " + scoreReport.tempScore.toString(),
          style: _subScoreTextStyle,
        ),
        Text(
          "Wind Speed - " + scoreReport.windScore.toString(),
          style: _subScoreTextStyle,
        ),
        Text(
          "Water Temperature - " + scoreReport.waterTemperatureScore.toString(),
          style: _subScoreTextStyle,
        ),
        Text(
          "Humidity - " + scoreReport.humidityScore.toString(),
          style: _subScoreTextStyle,
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    )
    );
  }
  Widget _buildChartDisplay  ()
    {
      List<CircularStackEntry> data = <CircularStackEntry>[
        new CircularStackEntry(
          <CircularSegmentEntry>[
            new CircularSegmentEntry(scoreReport.finalScore, Colors.blue[200], rankKey: 'Score'),
            new CircularSegmentEntry(10-scoreReport.finalScore, Colors.grey, rankKey: ''),

          ],
          rankKey: 'Quarterly Profits',
        )

      ];

      return new AnimatedCircularChart(
        key: _chartKey,
        size: const Size(300.0, 300.0),
        initialChartData: data,
        chartType: CircularChartType.Radial,
        holeLabel: scoreReport.finalScore.toString() + "/10",
        labelStyle: TextStyle(
          fontSize: 34,
          color: Colors.black,
        ),
      );

    }


    void postBuildFunction()  {
     // _chartKey.currentState.updateData(nextData);
    }
  @override
  Widget build(BuildContext context)  {

    return(
    Column(
      children: <Widget>[
        Text(
          "Quality Score",
          style: TextStyle(fontSize: 40),
        ),
        _buildChartDisplay(),
        _buildSubScorePanel(),
      ],
    )
    );

    //Execute last:
    postBuildFunction();
  }

}