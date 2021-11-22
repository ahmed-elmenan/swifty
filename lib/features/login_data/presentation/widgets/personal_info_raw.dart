import 'package:flutter/material.dart';
import 'package:swifty/features/login_data/domain/entities/login_data.dart';

class PersonalInfoRow extends StatelessWidget {
  final String info;
  final value;
  TextStyle textStyle = TextStyle(color: Colors.white);
  PersonalInfoRow({Key key, this.info, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(info, style: textStyle),
        Text(value.toString(), style: textStyle),
      ]),
    );
  }
}
