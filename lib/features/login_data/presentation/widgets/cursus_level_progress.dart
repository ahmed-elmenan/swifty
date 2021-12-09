import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:swifty/core/theme/GlobalTheme.dart';
import 'package:swifty/features/login_data/data/model/managed_cursus.dart';

class CursusLevelProgress extends StatelessWidget {
  final ManagedCursus projectCursus;
  const CursusLevelProgress({Key key, this.projectCursus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedCursusId = projectCursus.selectedIndex;
    double level = projectCursus.selectedIndex == -1
        ? 0
        : projectCursus.projectCursusMap[selectedCursusId].cursusInfo.level;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: LinearPercentIndicator(
        // width: MediaQuery.of(context).size.width, //width for progress bar
        animation: true, //animation to show progress at first
        animationDuration: 1000,
        lineHeight: 30.0, //height of progress bar
        percent: level / 100, // 30/100 = 0.3
        center: Text(
          level.toString() + " %",
          style: GlobalTheme.primaryTextStyle,
        ),
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
