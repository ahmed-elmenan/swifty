import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:swifty/core/theme/GlobalTheme.dart';

class SkillsChart extends StatelessWidget {
  Map<String, double> skillsMap;
  SkillsChart({Key key, this.skillsMap}) : super(key: key);

  List<Color> colorList = [
    Colors.red[400],
    Colors.yellow[300],
    Colors.green[300],
    Colors.blue[300],
    Colors.pink[300],
    Colors.purple[300],
    Colors.teal[300],
    Colors.grey[300],
    Colors.orange[300],
    Colors.cyan[300],
    Colors.lime[300],
  ];

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final isLandscape =
            MediaQuery.of(context).orientation == Orientation.landscape;
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                backgroundColor: GlobalTheme.homeBgColor,
                child: SingleChildScrollView(
                  child: PieChart(
                    dataMap: skillsMap,
                    animationDuration: Duration(milliseconds: 800),
                    chartLegendSpacing: 50,
                    chartRadius: isLandscape
                        ? MediaQuery.of(context).size.width / 3.5
                        : MediaQuery.of(context).size.width / 1.5,
                    colorList: colorList,
                    initialAngleInDegree: 0,
                    chartType: ChartType.ring,
                    ringStrokeWidth: 32,
                    centerText: "Skills",
                    legendOptions: LegendOptions(
                      showLegendsInRow: false,
                      legendPosition: isLandscape
                          ? LegendPosition.right
                          : LegendPosition.bottom,
                      showLegends: true,
                      legendShape: BoxShape.circle,
                      legendTextStyle: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValueBackground: true,
                      showChartValues: true,
                      showChartValuesInPercentage: true,
                      showChartValuesOutside: false,
                      decimalPlaces: 2,
                    ),
                    // gradientList: ---To add gradient colors---
                    // emptyColorGradient: ---Empty Color gradient---
                  ),
                )),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDialog(context);
      },
      child: Container(
        child: Text(
          "Display Skills ",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
