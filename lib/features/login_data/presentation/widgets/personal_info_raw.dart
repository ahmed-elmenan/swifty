import 'package:flutter/material.dart';
import 'package:swifty/core/theme/GlobalTheme.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';

class PersonalInfoRow extends StatelessWidget {
  final String info;
  final value;
  
  PersonalInfoRow({Key key, this.info, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(info, style: GlobalTheme.primaryTextStyle),
        Text(value.toString(), style: GlobalTheme.primaryTextStyle),
      ]),
    );
  }
}
