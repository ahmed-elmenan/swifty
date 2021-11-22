import 'package:flutter/material.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';
import 'package:swifty/features/login_data/presentation/bloc/login_data_bloc.dart';

import '../../../../injection_container.dart';
import 'login_avatar.dart';
import 'login_personal_info_card.dart';

class LoginInfoHeader extends StatefulWidget {
  final LoginData loginData;
  const LoginInfoHeader({Key key, this.loginData}) : super(key: key);

  @override
  _LoginInfoHeaderState createState() => _LoginInfoHeaderState();
}

class _LoginInfoHeaderState extends State<LoginInfoHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: new ExactAssetImage('assets/images/header_bg.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  LoginPersonalInfoCard(loginData: widget.loginData),
            ],
          ),
        ));
  }
}
