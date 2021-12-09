import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swifty/core/theme/GlobalTheme.dart';
import 'package:swifty/features/login_data/data/model/managed_cursus.dart';
import 'package:swifty/features/login_data/data/model/skill_model.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';
import 'package:swifty/features/login_data/presentation/widgets/personal_info_raw.dart';
import 'package:swifty/features/login_data/presentation/widgets/skills_chart.dart';

import 'cursus_drop_down_button.dart';

class LoginPersonalInfoCard extends StatelessWidget {
  final LoginData loginData;
  final ManagedCursus projectCursus;
  Map<String, double> skillsMap;
  LoginPersonalInfoCard({Key key, this.loginData, this.projectCursus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedCursusId = projectCursus.selectedIndex;
    if (projectCursus.selectedIndex != -1) {
      final skillsList =
          projectCursus.projectCursusMap[selectedCursusId].cursusInfo.skills;
      skillsMap = {};
      skillsList.forEach((skill) => skillsMap[skill.name] = skill.level);
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black.withOpacity(0.5), //GlobalTheme.secondaryBgColor,
      ),
      child: Column(
        children: [
          PersonalInfoRow(info: "Wallet", value: loginData.wallet),
          PersonalInfoRow(
              info: "Correction Points", value: loginData.correction_point),
          PersonalInfoRow(info: "Email", value: loginData.email),
          projectCursus.selectedIndex != -1
              ? Column(
                  children: [
                    skillsMap != null
                        ? Container(
                            margin: EdgeInsets.symmetric(vertical: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Skills",
                                    style: GlobalTheme.primaryTextStyle
                                        .copyWith(
                                            color: GlobalTheme.secondaryColor)),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      SkillsChart(
                                        skillsMap: skillsMap,
                                      ),
                                      FaIcon(
                                        FontAwesomeIcons.handPointUp,
                                        color: Colors.white,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Cursus",
                              style: GlobalTheme.primaryTextStyle
                                  .copyWith(color: GlobalTheme.secondaryColor)),
                          CursusDropDownButton(
                              projectCursus: projectCursus,
                              loginData: loginData)
                        ]),
                  ],
                )
              : SizedBox()
        ],
      ),
    );
  }
}
