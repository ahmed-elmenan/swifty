import 'package:flutter/material.dart';
import 'package:swifty/core/theme/GlobalTheme.dart';

class EmptyDataMessage extends StatelessWidget {
  const EmptyDataMessage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: (size.height - size.height / 3 + 70) / 2,
      child: Center(
          child: Text(
        "Nothing To Show",
        style: TextStyle(fontSize: 24, color: GlobalTheme.secondaryColor),
      )),
    );
  }
}
