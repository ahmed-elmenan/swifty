import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:swifty/core/theme/GlobalTheme.dart';

class CursusLevelProgress extends StatelessWidget {
  const CursusLevelProgress({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LinearPercentIndicator(
        //leaner progress bar
        // width: MediaQuery.of(context).size.width, //width for progress bar
        animation: true, //animation to show progress at first
        animationDuration: 1000,
        lineHeight: 30.0, //height of progress bar
        percent: 0.3, // 30/100 = 0.3
        center: Text("30.0%"),
        linearStrokeCap:
            LinearStrokeCap.roundAll, //make round cap at start and end both
        progressColor:
            GlobalTheme.secondaryColor, //percentage progress bar color
        backgroundColor:
            GlobalTheme.secondaryBgColor, //background progressbar color
      ),
    );
  }
}
