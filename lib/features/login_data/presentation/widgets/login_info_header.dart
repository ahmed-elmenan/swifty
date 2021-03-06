import 'package:flutter/material.dart';
import 'package:swifty/features/login_data/data/model/managed_cursus.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';

import 'cursus_level_progress.dart';
import 'location_widget.dart';
import 'login_personal_info_card.dart';



class LoginInfoHeader extends StatefulWidget {
  final LoginData loginData;
  final ManagedCursus projectCursus;
  const LoginInfoHeader({Key key, this.loginData, this.projectCursus}) : super(key: key);

  @override
  _LoginInfoHeaderState createState() => _LoginInfoHeaderState();
}

class _LoginInfoHeaderState extends State<LoginInfoHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: new ExactAssetImage('assets/images/header_bg.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LoginPersonalInfoCard(loginData: widget.loginData, projectCursus: widget.projectCursus),
                LocationWidget(location: widget.loginData.location),
                CursusLevelProgress(projectCursus: widget.projectCursus)
                
              ],
            ),
          ),
        ));
  }
}
