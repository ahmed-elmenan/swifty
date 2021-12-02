import 'package:flutter/material.dart';
import 'package:swifty/core/theme/GlobalTheme.dart';
import 'package:swifty/event_dispatcher/login_data_bloc_event_dispatcher.dart';
import 'package:swifty/features/login_data/data/model/managed_cursus.dart';
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: GlobalTheme.secondaryBgColor,
      ),
      child: Column(
        children: [
          PersonalInfoRow(info: "Wallet", value: loginData.wallet),
          PersonalInfoRow(
              info: "Correction Points", value: loginData.correction_point),
          PersonalInfoRow(info: "Email", value: loginData.email),
         projectCursus.selectedIndex != -1 ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Cursus",
                style: GlobalTheme.primaryTextStyle
                    .copyWith(color: GlobalTheme.secondaryColor)),
             CursusDropDownButton(
                projectCursus: projectCursus, loginData: loginData) 
          ]): SizedBox()
        ],
      ),
    );
  }
}
