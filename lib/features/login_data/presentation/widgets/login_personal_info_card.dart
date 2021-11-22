import 'package:flutter/material.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';
import 'package:swifty/features/login_data/presentation/widgets/personal_info_raw.dart';

class LoginPersonalInfoCard extends StatelessWidget {
  final LoginData loginData;
  const LoginPersonalInfoCard({Key key, this.loginData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
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
