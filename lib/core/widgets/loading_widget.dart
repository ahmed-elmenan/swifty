import 'package:flutter/material.dart';
import 'package:swifty/core/theme/GlobalTheme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(GlobalTheme.secondaryColor),
        ),
      ),
    );
  }
}
