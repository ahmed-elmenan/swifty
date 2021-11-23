import 'package:flutter/material.dart';
import 'package:swifty/core/theme/GlobalTheme.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';
import 'package:swifty/features/login_data/presentation/widgets/personal_info_raw.dart';

class LoginPersonalInfoCard extends StatelessWidget {
  final LoginData loginData;
  const LoginPersonalInfoCard({Key key, this.loginData}) : super(key: key);

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
          PersonalInfoRow(info: "Location", value: loginData.location),
          PersonalInfoRow(info: "Wallet", value: loginData.wallet),
          PersonalInfoRow(
              info: "Correction Points", value: loginData.correction_point),
          // PersonalInfoRow(info: "Cursus", value: loginData), // cursus algo
          PersonalInfoRow(info: "Email", value: loginData.email),
        ],
      ),
    );
  }
}
