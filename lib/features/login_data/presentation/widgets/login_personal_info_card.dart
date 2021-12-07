import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:swifty/core/theme/GlobalTheme.dart';
import 'package:swifty/event_dispatcher/login_data_bloc_event_dispatcher.dart';
import 'package:swifty/features/login_data/data/model/managed_cursus.dart';
import 'package:swifty/features/login_data/data/model/skill_model.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';
import 'package:swifty/features/login_data/domain/entities/projects_cursus.dart';
import 'package:swifty/features/login_data/presentation/widgets/personal_info_raw.dart';

import 'cursus_drop_down_button.dart';

class LoginPersonalInfoCard extends StatelessWidget {
  final LoginData loginData;
  final ManagedCursus projectCursus;
  const LoginPersonalInfoCard({Key key, this.loginData, this.projectCursus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedCursusId = projectCursus.selectedIndex;
    final skillsList =
        projectCursus.projectCursusMap[selectedCursusId].cursusInfo.skills;
    Map<String, double> skillsMap = {};
    skillsList.forEach((skill) => skillsMap[skill.name] = skill.level);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: GlobalTheme.secondaryBgColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text("Skills",
                  style: GlobalTheme.primaryTextStyle
                      .copyWith(color: GlobalTheme.secondaryColor)),
              SkillsChart(
                skillsMap: skillsMap,
              )
            ],
          ),
          PersonalInfoRow(info: "Wallet", value: loginData.wallet),
          PersonalInfoRow(
              info: "Correction Points", value: loginData.correction_point),
          PersonalInfoRow(info: "Email", value: loginData.email),
          projectCursus.selectedIndex != -1
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Text("Cursus",
                          style: GlobalTheme.primaryTextStyle
                              .copyWith(color: GlobalTheme.secondaryColor)),
                      CursusDropDownButton(
                          projectCursus: projectCursus, loginData: loginData)
                    ])
              : SizedBox()
        ],
      ),
    );
  }
}

class SkillsChart extends StatelessWidget {
  Map<String, double> skillsMap;
  SkillsChart({Key key, this.skillsMap}) : super(key: key);

  List<Color> colorList = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.purple,
    Colors.brown,
    Colors.grey,
    Colors.orange,
    Colors.cyan,
    Colors.lime,
  ];

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: Dialog(
                child: SingleChildScrollView(
              child: PieChart(
                dataMap: skillsMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 50,
                chartRadius: MediaQuery.of(context).size.width / 1.5,
                colorList: colorList,
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 32,
                centerText: "Skills",
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.bottom,
                  showLegends: true,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
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
        child: Text("display skills"),
      ),
    );
  }
}
